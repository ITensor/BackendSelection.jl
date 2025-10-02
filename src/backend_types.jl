macro generate_backend_type(type::Symbol)
  return generate_backend_type_expr(type)
end

function generate_backend_type_expr(type::Symbol)
  return esc(
    quote
      """
          $($type)

      A type representing a backend for a function.

      For example, a function might have multiple backends
      implementations, which internally are selected with a `$($type)` type.

      This allows users to extend functionality with a new implementation but
      use the same interface.
      """
      struct $type{Back,Kwargs<:NamedTuple} <: AbstractBackend
        kwargs::Kwargs
      end

      $type{Back}(kwargs::NamedTuple) where {Back} = $type{Back,typeof(kwargs)}(kwargs)
      $type{Back}(; kwargs...) where {Back} = $type{Back}(NamedTuple(kwargs))
      $type(s; kwargs...) = $type{Symbol(s)}(NamedTuple(kwargs))

      $type(backend::$type) = backend

      # TODO: Use `SetParameters`.
      backend_string(::$type{Back}) where {Back} = string(Back)
      parameters(backend::$type) = getfield(backend, :kwargs)

      # NamedTuple interface functions.
      Base.getproperty(backend::$type, name::Symbol) = parameters(backend)[name]
      Base.propertynames(backend::$type) = propertynames(parameters(backend))
      Base.getindex(backend::$type, name::Symbol) = parameters(backend)[name]
      function Base.get(backend::$type, name::Symbol, default)
        return get(parameters(backend), name, default)
      end

      function Base.show(io::IO, backend::$type)
        return print(
          io, "$($type) type ", backend_string(backend), ", ", parameters(backend)
        )
      end
      function Base.print(io::IO, backend::$type)
        return print(io, backend_string(backend), ", ", parameters(backend))
      end
    end,
  )
end

@generate_backend_type Algorithm
@generate_backend_type Backend

function backend_macro_docstring(backend)
  return """
      @$(backend)_str

  A convenience macro for writing [`$backend`](@ref) types, typically used when
  adding methods to a function that supports multiple backends.
  """
end

# TODO: See if these can be moved inside of `@eval`.
"""
$(backend_macro_docstring(:Algorithm))
"""
macro Algorithm_str(s)
  return :(Algorithm{$(Expr(:quote, Symbol(s)))})
end

"""
$(backend_macro_docstring(:Backend))
"""
macro Backend_str(s)
  return :(Backend{$(Expr(:quote, Symbol(s)))})
end
