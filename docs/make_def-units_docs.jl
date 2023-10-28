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

            
uids = uful_ids()

(;basicdims, compounddims) = uids |> getphysdims |> physdims_categories

basic_units =  unitsdict(basicdims, uids)
compound_units = unitsdict(compounddims, uids)

end # module