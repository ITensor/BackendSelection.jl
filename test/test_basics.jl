using BackendSelection: BackendSelection, @Algorithm_str, @Backend_str, Algorithm, Backend
using Test: @test, @testset

@testset "BackendSelection" begin
  for type in (Algorithm, Backend)
    @testset "$type" begin
      @test type("backend") isa type{:backend}
      @test type(:backend) isa type{:backend}
      backend = type("backend"; x=2, y=3)
      @test backend isa type{:backend}
      @test backend.x == 2
      @test backend.y == 3
      @test propertynames(backend) == (:x, :y)
      (; x, y) = backend
      @test x == 2
      @test y == 3
      @test BackendSelection.parameters(backend) === (; x=2, y=3)
    end
  end
  # Macro syntax.
  @test Algorithm"backend"(; x=2, y=3) === Algorithm("backend"; x=2, y=3)
  @test Backend"backend"(; x=2, y=3) === Backend("backend"; x=2, y=3)
  @test isnothing(show(Algorithm("")))
end
