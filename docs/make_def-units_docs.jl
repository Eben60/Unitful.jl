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

            
uids = uful_ids()
# ud = unitsdict(dims, uids)

(;basicdims, compounddims) = uids |> getphysdims |> physdims_categories

basic_units =  unitsdict(basicdims, uids)
compound_units = unitsdict(compounddims, uids)
phys_consts = physconstants(uids)

removerefs(d) = replace(d, r"\[(`[\w\.]+\`)]\(@ref\)" => s"\1")

# udoc(s) = removerefs(docstr(s))
udoc(s) = match(r"(?ms)(.+)\n\nDimension: ", docstr(s)).captures[1]

function nameofunit(u)
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

sections = OrderedDict(["Basic dimensions" => basic_units, 
    "Compound dimensions" => compound_units, ])

function makefulltext(sections)
    s = prolog() * "\n\n"
    for (sectiontitle, sectiondict) in sections
        s = makesectext(sectiontitle, sectiondict, s)
    end
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

end # module