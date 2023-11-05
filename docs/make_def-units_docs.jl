module MakeDefUnitsDocs

using Unitful, OrderedCollections

mdfile = "docs/src/defaultunits.md"
mdprolog = "docs/src/assets/defaultunits-prolog.md"
mdepilog = "docs/src/assets/defaultunits-epilog.md"


regularid(n) = ! startswith(string(n), r"#|@")

uful_ids() = [n for n in names(Unitful; all=true) if regularid(n)]


docstr(n) = Base.Docs.doc(Base.Docs.Binding(Unitful, n)) |> string

isdocumented(n) = ! startswith(docstr(n), "No documentation found.")

function gettypes(x::Type)
    if x isa UnionAll
        return gettypes(x.body)
    elseif x isa Union
        pns = propertynames(x)
        ts = [getproperty(x, pn) for pn in pns]
        ts = [t for t in ts if (t isa Type) && (t <: Unitful.Quantity)]
        return ts
    elseif x <: Unitful.Quantity
        return [x]
    else
        return []
    end
end

isprefixed(u) = occursin("A prefixed unit, equal", docstr(u))

getphysdims(uids) = [n for n in uids 
        if (getproperty(Unitful, n) isa UnionAll) && 
            ! endswith(string(n), "Units") &&
            ! occursin("Scale", string(n)) &&
            !isempty(gettypes(getproperty(Unitful, n)))]


getdim(x::Type) = gettypes(x)[1].parameters[2]

getdim(x::Symbol) = getdim(getproperty(Unitful, x))
getdimpars(x) = getproperty(typeof(getdim(x)), :parameters)
getdimpar(x) = getdimpars(x)[1][1]
getdimpow(x) = getdimpar(x).power

isbasicdim(x) = length(getdimpars(x)[1])== 1 && getdimpow(x) == 1

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

function unitsdict(physdims, uids)
    ups = []
    for d in physdims
        dm = getproperty(Unitful, d)
        units = Symbol[]
        for unm in uids
            u = getproperty(Unitful, unm)
            if (u isa Unitful.Units) 
                if (1*u isa dm) && !isprefixed(unm) && isdocumented(unm)
                    push!(units, unm)
                end
            end

        end
        if !isempty(units) 
            sort!(units; by = x -> lowercase(string(x)))
            unique!(x -> string(x) |> lowercase, units) # special case: Liter is l as well as L
            push!(ups, d => units)
        end
    end
    return OrderedDict(sort!(ups))
end

physconstants(uids) = [n for n in uids if 
    isconst(Unitful, n) && 
    !(getproperty(Unitful, n) isa Union{Type, Unitful.Units, Unitful.Dimensions, Module, Function}) &&
    isdocumented(n) ]

nodimsunits(uids) = [n for n in uids if isnodims(n) && isdocumented(n) && !isprefixed(n) && n != :NoUnits]

function isnodims(u) 
    u isa Unitful.FreeUnits || return false
    return getproperty(typeof(u), :parameters)[2] == NoDims
end
isnodims(u::Symbol) = isnodims(getproperty(Unitful, u))

removerefs(d) = replace(d, r"\[(`[\w\.]+\`)]\(@ref\)" => s"\1")

# udoc(s) = removerefs(docstr(s))
udoc(s) = match(r"(?ms)(.+)\n\nDimension: ", docstr(s)).captures[1] |> removerefs

function nameofunit(u)
    special = Dict(Unitful.ha => "Hectare", Unitful.kg => "Kilogram")
    u in keys(special) && return special[u]
    t = typeof(u)
    ps = getproperty(t, :parameters)
    u1 = ps[1][1]
    @assert u1 isa Unitful.Unit
    t1 = typeof(u1)
    uname = getproperty(t1, :parameters)[1]
    return string(uname)
end

nameofunit(s::Symbol) = nameofunit(getproperty(Unitful, s))

function makesectext(sectiontitle, sectiondict, s0="")
    s = s0 * "## $sectiontitle \n\n"
    for (dim, uvec) in sectiondict 
        s *= "### $dim\n\n"
        for u in uvec 
            n = nameofunit(u)
            d = udoc(u) 
            s *= "#### $n \n\n$d \n\n"
        end
    end
    return s
end

function makefulltext(sections)
    s = prolog() * "\n\n"
    for (sectiontitle, sectiondict) in sections
        s = makesectext(sectiontitle, sectiondict, s)
    end
    s = makeprefixsec(prefnamesvals(), s)
    s *= epylog()
    return s
end

# fulltext = makefulltext(sections)

prolog() = read(mdprolog) |> String
epylog() = read(mdepilog) |> String

function savetext(fulltext, mdfile)
    open(mdfile,"w") do io
       write(io, fulltext)
    end
    return nothing
end

function savetext(wr = true)
    fulltext = makefulltext(sections)
    wr && savetext(fulltext, mdfile)
    return fulltext
end
    
export savetext

function prefnamesvals()
    prefixnamestable = [
    ("quetta" ,  "Q" ,  1E+030 ) , 
    ("ronna" ,  "R" ,  1E+027 ) , 
    ("yotta" ,  "Y" ,  1E+024 ) , 
    ("zetta" ,  "Z" ,  1E+021 ) , 
    ("exa" ,  "E" ,  1E+018 ) , 
    ("peta" ,  "P" ,  1000000000000000 ) , 
    ("tera" ,  "T" ,  1000000000000 ) , 
    ("giga" ,  "G" ,  1000000000 ) , 
    ("mega" ,  "M" ,  1000000 ) , 
    ("kilo" ,  "k" ,  1000 ) , 
    ("hecto" ,  "h" ,  100 ) , 
    ("deca" ,  "da" ,  10 ) , 
    ("deci" ,  "d" ,  0.1 ) , 
    ("centi" ,  "c" ,  0.01 ) , 
    ("milli" ,  "m" ,  0.001 ) , 
    ("micro" ,  "μ" ,  0.000001 ) , 
    ("nano" ,  "n" ,  0.000000001 ) , 
    ("pico" ,  "p" ,  1E-12 ) , 
    ("femto" ,  "f" ,  1E-15 ) , 
    ("atto" ,  "a" ,  1E-18 ) , 
    ("zepto" ,  "z" ,  1E-21 ) , 
    ("yocto" ,  "y" ,  1E-24 ) , 
    ("ronto" ,  "r" ,  1E-27 ) , 
    ]
    pd = Unitful.prefixdict
    sxp = sort(collect(keys(pd)))

    pnn = Dict([p[2] => p[1] for p in prefixnamestable])
    pnv = Dict([p[2] => p[3] for p in prefixnamestable])

    @assert all([log10(pnv[v]) == k for (k, v) in pd if pd[k] != ""])
    return OrderedDict([pd[k] => (pnn[pd[k]], k) for k in sxp if pd[k] != ""])  
end
# pnv = prefnamesvals()

function makeprefixsec(pnv, s0="")
    s = s0 * """
## Metric (SI) Prefixes

| Prefix | Name | Power of Ten |
|--------|--------|--------|
"""
    for (k,v) in pnv
        s *= "| $k | $(v[1]) | $(v[2]) | \n"
    end

    return s
end

uids = uful_ids()
# ud = unitsdict(dims, uids)

(;basicdims, compounddims) = uids |> getphysdims |> physdims_categories

basic_units =  unitsdict(basicdims, uids)
compound_units = unitsdict(compounddims, uids)
sections = OrderedDict(["Basic dimensions" => basic_units, 
    "Compound dimensions" => compound_units, ])
nodims_units = nodimsunits(uids) 
phys_consts = physconstants(uids)

end # module