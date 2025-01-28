var documenterSearchIndex = {"docs":
[{"location":"reference/#Reference","page":"Reference","title":"Reference","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"Modules = [BackendSelection]","category":"page"},{"location":"reference/#BackendSelection.Algorithm","page":"Reference","title":"BackendSelection.Algorithm","text":"BackendSelection.Algorithm\n\nA type representing a backend for a function.\n\nFor example, a function might have multiple backends implementations, which internally are selected with a BackendSelection.Algorithm type.\n\nThis allows users to extend functionality with a new implementation but use the same interface.\n\n\n\n\n\n","category":"type"},{"location":"reference/#BackendSelection.Backend","page":"Reference","title":"BackendSelection.Backend","text":"BackendSelection.Backend\n\nA type representing a backend for a function.\n\nFor example, a function might have multiple backends implementations, which internally are selected with a BackendSelection.Backend type.\n\nThis allows users to extend functionality with a new implementation but use the same interface.\n\n\n\n\n\n","category":"type"},{"location":"reference/#BackendSelection.@Algorithm_str-Tuple{Any}","page":"Reference","title":"BackendSelection.@Algorithm_str","text":"@Algorithm_str\n\nA convenience macro for writing Algorithm types, typically used when adding methods to a function that supports multiple algorithm backends.\n\n\n\n\n\n","category":"macro"},{"location":"reference/#BackendSelection.@Backend_str-Tuple{Any}","page":"Reference","title":"BackendSelection.@Backend_str","text":"@Backend_str\n\nA convenience macro for writing Backend types, typically used when adding methods to a function that supports multiple backends.\n\n\n\n\n\n","category":"macro"},{"location":"","page":"Home","title":"Home","text":"EditURL = \"../../examples/README.jl\"","category":"page"},{"location":"#BackendSelection.jl","page":"Home","title":"BackendSelection.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: Stable) (Image: Dev) (Image: Build Status) (Image: Coverage) (Image: Code Style: Blue) (Image: Aqua)","category":"page"},{"location":"#Installation-instructions","page":"Home","title":"Installation instructions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package resides in the ITensor/ITensorRegistry local registry. In order to install, simply add that registry through your package manager. This step is only required once.","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Pkg: Pkg\n\njulia> Pkg.Registry.add(url=\"https://github.com/ITensor/ITensorRegistry\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"or:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> Pkg.Registry.add(url=\"git@github.com:ITensor/ITensorRegistry.git\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"if you want to use SSH credentials, which can make it so you don't have to enter your Github ursername and password when registering packages.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Then, the package can be added as usual through the package manager:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> Pkg.add(\"BackendSelection\")","category":"page"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using BackendSelection: BackendSelection","category":"page"},{"location":"","page":"Home","title":"Home","text":"Examples go here.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"This page was generated using Literate.jl.","category":"page"}]
}
