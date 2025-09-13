module CollectNames

using Unitful
using ShareAdd
@usingany OrderedCollections


regularid(n) = !startswith(string(n), r"#|@")

uful_ids() = filter(regularid, names(Unitful; all=true))

docstr(n::Symbol) = Base.Docs.doc(Base.Docs.Binding(Unitful, n)) |> string

isprefixed(u::Symbol) = occursin("A prefixed unit, equal", docstr(u))

isdocumented(n::Symbol) = !startswith(docstr(n), "No documentation found")

"""
    getphysdims(uids::Vector{Symbol})
Filters the list of `Unitful` identifiers to return those which denote physical dimensions (e.g. `Area`, `Power`)
"""
getphysdims(uids) = filter(isphysdim, uids)

isphysdim(n::Symbol) = _isphysdim(getproperty(Unitful, n))
_isphysdim(_) = false
_isphysdim(::Type{Union{Quantity{T,D,U}, Level{L,S,Quantity{T,D,U}} where {L,S}} where {T,U}}) where D = true

"""
# Examples
```julia-repl
julia> getdim(Unitful.Area)
𝐋^2
```
"""
getdim(::Type{Union{Quantity{T,D,U}, Level{L,S,Quantity{T,D,U}} where {L,S}} where {T,U}}) where D = D
getdim(x::Symbol) = getdim(getproperty(Unitful, x))

"""
# Examples
```julia-repl
julia> getdimpars(Unitful.Power)
svec((Unitful.Dimension{:Length}(2//1), Unitful.Dimension{:Mass}(1//1), Unitful.Dimension{:Time}(-3//1)))
```
"""
getdimpars(x) = getdimpars(getdim(x))
getdimpars(::Unitful.Dimensions{N}) where N = N

getdimpow(x) = only(getdimpars(x)).power

isbasicdim(x) = length(getdimpars(x)) == 1 && getdimpow(x) == 1

function physdims_categories(physdims)
    basicdims = Symbol[]
    compounddims = Symbol[]
    otherdims =  Symbol[]
    for d in physdims
        try
            if isbasicdim(d)
                push!(basicdims, d)
            else
                push!(compounddims, d)
            end
        catch
            push!(otherdims, d)
        end
    end
    return (;basicdims, compounddims, otherdims, )
end

"""
# Examples
```julia-repl
julia> unitsdict(basicdims, uids)
OrderedCollections.OrderedDict{Symbol, Vector{Symbol}} with 7 entries:
  :Amount      => [:mol]
  :Current     => [:A]
  :Length      => [:angstrom, :ft, :inch, :m, :mi, :mil, :yd]
  :Luminosity  => [:cd, :lm]
  :Mass        => [:dr, :g, :gr, :kg, :lb, :oz, :slug, :u]
  :Temperature => [:K, :Ra, :°C, :°F]
  :Time        => [:d, :hr, :minute, :s, :wk, :yr]
```
"""
function unitsdict(physdims, uids; debug=false)
    ups = []
    for d in physdims
        dm = getproperty(Unitful, d)
        units = Symbol[]
        for uname in uids
            u = getproperty(Unitful, uname)
            if (u isa Unitful.Units) 
                # if (1*u isa dm) && (true || !isprefixed(uname) || uname == :g) && isdocumented(uname) # gram considered prefixed unit
                if (1*u isa dm) && isdocumented(uname)
                    debug && isprefixed(uname) && println(uname)
                    push!(units, uname)
                    debug && println(length(units))
                end
            end
        end
        if !isempty(units) 
            sort!(units; by = x -> lowercase(string(x)))
            # unique!(nameofunit, units) # special cases: Liter, Angstrom
            push!(ups, d => units)
        end
        debug && break
    end
    return OrderedDict(sort!(ups))
end

function physconstants(uids) 
    ph_consts = [n for n in uids if 
        isconst(Unitful, n) && 
        (getproperty(Unitful, n) isa Quantity) &&
        isdocumented(n) ]
    sort!(ph_consts, by = x -> lowercase(string(x)))
    return ph_consts
end

physconstant(n) = isconst(Unitful, n) && 
        (getproperty(Unitful, n) isa Quantity) &&
        isdocumented(n)

function isnodims(u) 
    u isa Unitful.FreeUnits || return false
    return dimension(u) == NoDims
end
isnodims(u::Symbol) = isnodims(getproperty(Unitful, u))

nodimsunits(uids) = [n for n in uids if isnodims(n) && isdocumented(n) && !isprefixed(n) && n != :NoUnits]

nodimsunit(n) = isnodims(n) && isdocumented(n) && !isprefixed(n) && n != :NoUnits

function nameofunit(u)
    special = Dict(u"ha" => "Hectare", u"kg" => "Kilogram", u"°F" => "Degree Fahrenheit", u"°C" => "Degree Celcius")
    u in keys(special) && return special[u]
    n = _nameofunit(u)
    isnothing(n) && return nothing
    return string(_nameofunit(u))
    # return _nameofunit(u)
end

nameofunit(s::Symbol) = nameofunit(getproperty(Unitful, s))

function _nameofunit(::Unitful.Units{N}) where N
    length(N) != 1 && return nothing
    return _nameofunit(only(N))
end

_nameofunit(::Unitful.Unit{U}) where U = U
_nameofunit(::Any) = nothing

function isquantity(s)
    x = getproperty(Unitful, s)
    x isa Type || return false
    return x <: Unitful.Quantity
end

function isunittype(s)
    x = getproperty(Unitful, s)
    x isa Type || return false
        return x <: Unitful.Units
end

function filternames(f, other_names; m=Unitful, assymbol=false) 
    filtered = assymbol ? 
        filter(f, other_names) :
        filter(x -> f(getproperty(m, x)), other_names)
    setdiff!(other_names, filtered)
    return filtered
end

const privatevars = [:BCAST_PROPAGATE_CALLS, :allowed_funcs, :basefactors, :prefixdict, :promotion, :si_no_prefix, :si_prefixes, :unitmodules]

function collect_pubnames()
    uids = uful_ids()
    other_names = copy(uids)
    setdiff!(other_names, privatevars)

    fnm(f; assymbol=false) = filternames(f, other_names; assymbol)

    _basenames =  names(Base; all=true)
    base_names = fnm(x -> x in _basenames; assymbol=true)
    exported_names = fnm(x -> Base.isexported(Unitful, x); assymbol=true)
    
    _internal_names = filter(x -> startswith(x |> string, "_"), uids)
    setdiff!(other_names, _internal_names)

    module_names = fnm(x -> x isa Module)

    nodims_units = fnm(nodimsunit; assymbol=true)
    phys_consts = fnm(physconstant; assymbol=true)

    (basic_dims, compound_dims, _) = uids |> getphysdims |> physdims_categories
    setdiff!(other_names, union(basic_dims, compound_dims))

    unit_names = fnm(x -> !isnothing(nameofunit(x)))

    bu =  unitsdict(basic_dims, uids) |> values
    basic_units = reduce(vcat, bu)

    cu = unitsdict(compound_dims, uids) |> values
    compound_units = reduce(vcat, cu)

    setdiff!(other_names, union(basic_units, basic_units))

    dim_abbreviations = fnm(x -> x isa Unitful.Dimensions)

    quantities = fnm(isquantity,; assymbol=true)
    unit_types = fnm(isunittype; assymbol=true)

    log_units = fnm(x -> x isa Unitful.MixedUnits)
    abstract_types = fnm(isabstracttype)
    concrete_types = fnm(x -> x isa Type)
    private_fns = fnm(x -> x isa Function)


    return (;
    uids, other_names, _internal_names, module_names, base_names, exported_names, private_fns,
    nodims_units, phys_consts, basic_dims, compound_dims, unit_names, 
    basic_units, compound_units, dim_abbreviations, quantities, unit_types,
    log_units, abstract_types, concrete_types)
end

function public_string(a, publics=true; maxlength=90)
    strings = String[]
    line = publics ? "public " : "    "
    for s in a
        nextword = string(s)
        if length(line) + length(nextword) + 2 > maxlength
            push!(strings, line)
            line = "    "
        end
        line = line * nextword
        if s != last(a)
            line = line * ", "
        end
    end
    push!(strings, line)

    if !publics
        push!(strings, "\""^3)
        pushfirst!(strings, "\""^3)
    end

    return strings
end

end # module
