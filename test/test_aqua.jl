using Aqua: Aqua
using BackendSelection: BackendSelection
using Test: @testset

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(BackendSelection)
end
