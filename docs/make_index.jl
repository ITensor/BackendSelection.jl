using Literate: Literate
using BackendSelection: BackendSelection

Literate.markdown(
  joinpath(pkgdir(BackendSelection), "examples", "README.jl"),
  joinpath(pkgdir(BackendSelection), "docs", "src");
  flavor=Literate.DocumenterFlavor(),
  name="index",
)
