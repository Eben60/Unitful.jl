using Documenter, Unitful, Dates

ENV["UNITFUL_FANCY_EXPONENTS"] = false

DocMeta.setdocmeta!(Unitful, :DocTestSetup, :(using Unitful))

function check_defaultunits_version()
    vfile = "docs/src/assets/vfile.txt"
    r = readline(vfile)
    docs_v = VersionNumber(r)
    pkg_v = pkgversion(Unitful)
    docs_v == pkg_v || error("Docs chapter on default units built with the wrong version of Unitful \
    (docs built for $docs_v vs current Unitful version $pkg_v). \
    Please run the script on the local computer with the proper Unitful version")
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
