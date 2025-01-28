using Literate: Literate
using BackendSelection: BackendSelection

Literate.markdown(
  joinpath(pkgdir(BackendSelection), "examples", "README.jl"),
  joinpath(pkgdir(BackendSelection));
  flavor=Literate.CommonMarkFlavor(),
  name="README",
)
