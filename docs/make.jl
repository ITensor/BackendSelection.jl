using BackendSelection: BackendSelection
using Documenter: Documenter, DocMeta, deploydocs, makedocs

DocMeta.setdocmeta!(
  BackendSelection, :DocTestSetup, :(using BackendSelection); recursive=true
)

include("make_index.jl")

makedocs(;
  modules=[BackendSelection],
  authors="ITensor developers <support@itensor.org> and contributors",
  sitename="BackendSelection.jl",
  format=Documenter.HTML(;
    canonical="https://ITensor.github.io/BackendSelection.jl",
    edit_link="main",
    assets=["assets/favicon.ico", "assets/extras.css"],
  ),
  pages=["Home" => "index.md", "Reference" => "reference.md"],
)

deploydocs(;
  repo="github.com/ITensor/BackendSelection.jl", devbranch="main", push_preview=true
)
