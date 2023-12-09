module GetUnitfulVersion
using Pkg

function vers()
    base = joinpath(splitpath(Base.active_project())[begin:end-2])
    proj = joinpath(base, "Project.toml")
    v = Pkg.TOML.parsefile(proj)["version"]
    return VersionNumber(v)
end

end