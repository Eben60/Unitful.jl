module MakeDefUnitsDocs

using Unitful, OrderedCollections

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

udoc(s) = removerefs(docstr(s))

function makesectext(sectiontitle, sectiondict, s0="")
    s = s0 * "## $sectiontitle \n\n"
    for (dim, uvec) in sectiondict # e.g. :Amount => [:mol]
        for u in uvec # e.g. u = :mol 
            d = udoc(u) # e.g. d = "```\nUnitful.mol\n```\n\nThe mole, ..."
            s *= "$d \n\n"
        end
    end
    return s
end

sections = OrderedDict(["Basic dimensions" => basic_units, 
    "Compound dimensions" => compound_units, ])

function makefulltext(sections, pagetitle="# Title!", footer="that's it")
    s = pagetitle * "\n\n"
    for (sectiontitle, sectiondict) in sections
        println(sectiontitle)
        s = makesectext(sectiontitle, sectiondict, s)
    end
    s *= footer
    return s
end

# fulltext = makefulltext(sections)
mdfile = "src/tmp.md"

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