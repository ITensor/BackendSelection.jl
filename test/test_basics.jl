using BackendSelection: BackendSelection, @Algorithm_str, @Backend_str, Algorithm, Backend
using Test: @test, @testset
using TestExtras: @constinferred

@testset "BackendSelection" begin
    for type in (Algorithm, Backend)
        @testset "$type" begin
            # Note: constructing from a string is not type stable.
            @test type("backend") isa type{:backend}
            @test @constinferred(type(:backend)) isa type{:backend}
            backend = @constinferred type(:backend; x = 2, y = 3)
            @test backend === type("backend"; x = 2, y = 3)
            @test backend isa type{:backend}
            @test backend.x == 2
            @test backend.y == 3
            @test @constinferred(getproperty(backend, :x)) == 2
            @test @constinferred(getproperty(backend, :y)) == 3
            @test @constinferred(backend[:x]) == 2
            @test @constinferred(backend[:y]) == 3
            @test @constinferred(get(backend, :x, "default")) == 2
            @test @constinferred(get(backend, :y, "default")) == 3
            @test @constinferred(get(backend, :z, "default")) == "default"
            @test @constinferred(propertynames(backend)) == (:x, :y)
            (; x, y) = backend
            @test x == 2
            @test y == 3
            @test @constinferred(BackendSelection.parameters(backend)) === (; x = 2, y = 3)
        end
    end
    # Macro syntax.
    @test @constinferred(Algorithm"backend"(; x = 2, y = 3)) === Algorithm("backend"; x = 2, y = 3)
    @test @constinferred(Backend"backend"(; x = 2, y = 3)) === Backend("backend"; x = 2, y = 3)
    @test isnothing(show(Algorithm("")))
end
