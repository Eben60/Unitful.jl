using Documenter, Unitful, Dates

ENV["UNITFUL_FANCY_EXPONENTS"] = false

DocMeta.setdocmeta!(Unitful, :DocTestSetup, :(using Unitful))

function check_defaultunits_version()
    vfile = "docs/src/assets/vfile.txt"
    r = readline(vfile)
    @assert VersionNumber(r) == pkgversion(Unitful)
    return nothing
end

makedocs(
    sitename = "Unitful.jl",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    warnonly = [:missing_docs],
    modules = [Unitful],
    workdir = joinpath(@__DIR__, ".."),
    pages = [
        "Home" => "index.md"
        "Highlighted features" => "highlights.md"
        "Types" => "types.md"
        "Defining new units" => "newunits.md"
        "Conversion/promotion" => "conversion.md"
        "Manipulating units" => "manipulations.md"
        "How units are displayed" => "display.md"
        "Logarithmic scales" => "logarithm.md"
        "Temperature scales" => "temperature.md"
        "Interoperability with `Dates`" => "dates.md"
        "Extending Unitful" => "extending.md"
        "Troubleshooting" => "trouble.md"
        "Pre-defined units and constants" => "defaultunits.md"
        "License" => "LICENSE.md"
    ]
)

# deploydocs(repo = "github.com/PainterQubits/Unitful.jl.git")
