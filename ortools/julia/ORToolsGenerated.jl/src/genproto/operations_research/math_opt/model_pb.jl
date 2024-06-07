# Autogenerated using ProtoBuf.jl v1.0.14 on 2024-01-02T18:44:47.189
# original file: /usr/local/google/home/tcuvelier/.julia/artifacts/cc3d5aa28fb2158ce4ff5aed9899545a37503a6b/include/ortools/math_opt/model.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export QuadraticConstraintProto, LinearConstraintsProto, SecondOrderConeConstraintProto
export IndicatorConstraintProto, VariablesProto, SosConstraintProto, ObjectiveProto
export ModelProto

struct QuadraticConstraintProto
    linear_terms::Union{Nothing,SparseDoubleVectorProto}
    quadratic_terms::Union{Nothing,SparseDoubleMatrixProto}
    lower_bound::Float64
    upper_bound::Float64
    name::String
end
PB.default_values(::Type{QuadraticConstraintProto}) = (;linear_terms = nothing, quadratic_terms = nothing, lower_bound = zero(Float64), upper_bound = zero(Float64), name = "")
PB.field_numbers(::Type{QuadraticConstraintProto}) = (;linear_terms = 1, quadratic_terms = 2, lower_bound = 3, upper_bound = 4, name = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:QuadraticConstraintProto})
    linear_terms = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    quadratic_terms = Ref{Union{Nothing,SparseDoubleMatrixProto}}(nothing)
    lower_bound = zero(Float64)
    upper_bound = zero(Float64)
    name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, linear_terms)
        elseif field_number == 2
            PB.decode!(d, quadratic_terms)
        elseif field_number == 3
            lower_bound = PB.decode(d, Float64)
        elseif field_number == 4
            upper_bound = PB.decode(d, Float64)
        elseif field_number == 5
            name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return QuadraticConstraintProto(linear_terms[], quadratic_terms[], lower_bound, upper_bound, name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::QuadraticConstraintProto)
    initpos = position(e.io)
    !isnothing(x.linear_terms) && PB.encode(e, 1, x.linear_terms)
    !isnothing(x.quadratic_terms) && PB.encode(e, 2, x.quadratic_terms)
    x.lower_bound != zero(Float64) && PB.encode(e, 3, x.lower_bound)
    x.upper_bound != zero(Float64) && PB.encode(e, 4, x.upper_bound)
    !isempty(x.name) && PB.encode(e, 5, x.name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::QuadraticConstraintProto)
    encoded_size = 0
    !isnothing(x.linear_terms) && (encoded_size += PB._encoded_size(x.linear_terms, 1))
    !isnothing(x.quadratic_terms) && (encoded_size += PB._encoded_size(x.quadratic_terms, 2))
    x.lower_bound != zero(Float64) && (encoded_size += PB._encoded_size(x.lower_bound, 3))
    x.upper_bound != zero(Float64) && (encoded_size += PB._encoded_size(x.upper_bound, 4))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 5))
    return encoded_size
end

struct LinearConstraintsProto
    ids::Vector{Int64}
    lower_bounds::Vector{Float64}
    upper_bounds::Vector{Float64}
    names::Vector{String}
end
PB.default_values(::Type{LinearConstraintsProto}) = (;ids = Vector{Int64}(), lower_bounds = Vector{Float64}(), upper_bounds = Vector{Float64}(), names = Vector{String}())
PB.field_numbers(::Type{LinearConstraintsProto}) = (;ids = 1, lower_bounds = 2, upper_bounds = 3, names = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:LinearConstraintsProto})
    ids = PB.BufferedVector{Int64}()
    lower_bounds = PB.BufferedVector{Float64}()
    upper_bounds = PB.BufferedVector{Float64}()
    names = PB.BufferedVector{String}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, ids)
        elseif field_number == 2
            PB.decode!(d, wire_type, lower_bounds)
        elseif field_number == 3
            PB.decode!(d, wire_type, upper_bounds)
        elseif field_number == 4
            PB.decode!(d, names)
        else
            PB.skip(d, wire_type)
        end
    end
    return LinearConstraintsProto(ids[], lower_bounds[], upper_bounds[], names[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::LinearConstraintsProto)
    initpos = position(e.io)
    !isempty(x.ids) && PB.encode(e, 1, x.ids)
    !isempty(x.lower_bounds) && PB.encode(e, 2, x.lower_bounds)
    !isempty(x.upper_bounds) && PB.encode(e, 3, x.upper_bounds)
    !isempty(x.names) && PB.encode(e, 4, x.names)
    return position(e.io) - initpos
end
function PB._encoded_size(x::LinearConstraintsProto)
    encoded_size = 0
    !isempty(x.ids) && (encoded_size += PB._encoded_size(x.ids, 1))
    !isempty(x.lower_bounds) && (encoded_size += PB._encoded_size(x.lower_bounds, 2))
    !isempty(x.upper_bounds) && (encoded_size += PB._encoded_size(x.upper_bounds, 3))
    !isempty(x.names) && (encoded_size += PB._encoded_size(x.names, 4))
    return encoded_size
end

struct SecondOrderConeConstraintProto
    upper_bound::Union{Nothing,LinearExpressionProto}
    arguments_to_norm::Vector{LinearExpressionProto}
    name::String
end
PB.default_values(::Type{SecondOrderConeConstraintProto}) = (;upper_bound = nothing, arguments_to_norm = Vector{LinearExpressionProto}(), name = "")
PB.field_numbers(::Type{SecondOrderConeConstraintProto}) = (;upper_bound = 1, arguments_to_norm = 2, name = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SecondOrderConeConstraintProto})
    upper_bound = Ref{Union{Nothing,LinearExpressionProto}}(nothing)
    arguments_to_norm = PB.BufferedVector{LinearExpressionProto}()
    name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, upper_bound)
        elseif field_number == 2
            PB.decode!(d, arguments_to_norm)
        elseif field_number == 3
            name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SecondOrderConeConstraintProto(upper_bound[], arguments_to_norm[], name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SecondOrderConeConstraintProto)
    initpos = position(e.io)
    !isnothing(x.upper_bound) && PB.encode(e, 1, x.upper_bound)
    !isempty(x.arguments_to_norm) && PB.encode(e, 2, x.arguments_to_norm)
    !isempty(x.name) && PB.encode(e, 3, x.name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SecondOrderConeConstraintProto)
    encoded_size = 0
    !isnothing(x.upper_bound) && (encoded_size += PB._encoded_size(x.upper_bound, 1))
    !isempty(x.arguments_to_norm) && (encoded_size += PB._encoded_size(x.arguments_to_norm, 2))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 3))
    return encoded_size
end

struct IndicatorConstraintProto
    indicator_id::Int64
    activate_on_zero::Bool
    expression::Union{Nothing,SparseDoubleVectorProto}
    lower_bound::Float64
    upper_bound::Float64
    name::String
end
PB.default_values(::Type{IndicatorConstraintProto}) = (;indicator_id = zero(Int64), activate_on_zero = false, expression = nothing, lower_bound = zero(Float64), upper_bound = zero(Float64), name = "")
PB.field_numbers(::Type{IndicatorConstraintProto}) = (;indicator_id = 1, activate_on_zero = 6, expression = 2, lower_bound = 3, upper_bound = 4, name = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:IndicatorConstraintProto})
    indicator_id = zero(Int64)
    activate_on_zero = false
    expression = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    lower_bound = zero(Float64)
    upper_bound = zero(Float64)
    name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            indicator_id = PB.decode(d, Int64)
        elseif field_number == 6
            activate_on_zero = PB.decode(d, Bool)
        elseif field_number == 2
            PB.decode!(d, expression)
        elseif field_number == 3
            lower_bound = PB.decode(d, Float64)
        elseif field_number == 4
            upper_bound = PB.decode(d, Float64)
        elseif field_number == 5
            name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return IndicatorConstraintProto(indicator_id, activate_on_zero, expression[], lower_bound, upper_bound, name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::IndicatorConstraintProto)
    initpos = position(e.io)
    x.indicator_id != zero(Int64) && PB.encode(e, 1, x.indicator_id)
    x.activate_on_zero != false && PB.encode(e, 6, x.activate_on_zero)
    !isnothing(x.expression) && PB.encode(e, 2, x.expression)
    x.lower_bound != zero(Float64) && PB.encode(e, 3, x.lower_bound)
    x.upper_bound != zero(Float64) && PB.encode(e, 4, x.upper_bound)
    !isempty(x.name) && PB.encode(e, 5, x.name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::IndicatorConstraintProto)
    encoded_size = 0
    x.indicator_id != zero(Int64) && (encoded_size += PB._encoded_size(x.indicator_id, 1))
    x.activate_on_zero != false && (encoded_size += PB._encoded_size(x.activate_on_zero, 6))
    !isnothing(x.expression) && (encoded_size += PB._encoded_size(x.expression, 2))
    x.lower_bound != zero(Float64) && (encoded_size += PB._encoded_size(x.lower_bound, 3))
    x.upper_bound != zero(Float64) && (encoded_size += PB._encoded_size(x.upper_bound, 4))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 5))
    return encoded_size
end

struct VariablesProto
    ids::Vector{Int64}
    lower_bounds::Vector{Float64}
    upper_bounds::Vector{Float64}
    integers::Vector{Bool}
    names::Vector{String}
end
PB.default_values(::Type{VariablesProto}) = (;ids = Vector{Int64}(), lower_bounds = Vector{Float64}(), upper_bounds = Vector{Float64}(), integers = Vector{Bool}(), names = Vector{String}())
PB.field_numbers(::Type{VariablesProto}) = (;ids = 1, lower_bounds = 2, upper_bounds = 3, integers = 4, names = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:VariablesProto})
    ids = PB.BufferedVector{Int64}()
    lower_bounds = PB.BufferedVector{Float64}()
    upper_bounds = PB.BufferedVector{Float64}()
    integers = PB.BufferedVector{Bool}()
    names = PB.BufferedVector{String}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, ids)
        elseif field_number == 2
            PB.decode!(d, wire_type, lower_bounds)
        elseif field_number == 3
            PB.decode!(d, wire_type, upper_bounds)
        elseif field_number == 4
            PB.decode!(d, wire_type, integers)
        elseif field_number == 5
            PB.decode!(d, names)
        else
            PB.skip(d, wire_type)
        end
    end
    return VariablesProto(ids[], lower_bounds[], upper_bounds[], integers[], names[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::VariablesProto)
    initpos = position(e.io)
    !isempty(x.ids) && PB.encode(e, 1, x.ids)
    !isempty(x.lower_bounds) && PB.encode(e, 2, x.lower_bounds)
    !isempty(x.upper_bounds) && PB.encode(e, 3, x.upper_bounds)
    !isempty(x.integers) && PB.encode(e, 4, x.integers)
    !isempty(x.names) && PB.encode(e, 5, x.names)
    return position(e.io) - initpos
end
function PB._encoded_size(x::VariablesProto)
    encoded_size = 0
    !isempty(x.ids) && (encoded_size += PB._encoded_size(x.ids, 1))
    !isempty(x.lower_bounds) && (encoded_size += PB._encoded_size(x.lower_bounds, 2))
    !isempty(x.upper_bounds) && (encoded_size += PB._encoded_size(x.upper_bounds, 3))
    !isempty(x.integers) && (encoded_size += PB._encoded_size(x.integers, 4))
    !isempty(x.names) && (encoded_size += PB._encoded_size(x.names, 5))
    return encoded_size
end

struct SosConstraintProto
    expressions::Vector{LinearExpressionProto}
    weights::Vector{Float64}
    name::String
end
PB.default_values(::Type{SosConstraintProto}) = (;expressions = Vector{LinearExpressionProto}(), weights = Vector{Float64}(), name = "")
PB.field_numbers(::Type{SosConstraintProto}) = (;expressions = 1, weights = 2, name = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SosConstraintProto})
    expressions = PB.BufferedVector{LinearExpressionProto}()
    weights = PB.BufferedVector{Float64}()
    name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, expressions)
        elseif field_number == 2
            PB.decode!(d, wire_type, weights)
        elseif field_number == 3
            name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return SosConstraintProto(expressions[], weights[], name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SosConstraintProto)
    initpos = position(e.io)
    !isempty(x.expressions) && PB.encode(e, 1, x.expressions)
    !isempty(x.weights) && PB.encode(e, 2, x.weights)
    !isempty(x.name) && PB.encode(e, 3, x.name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SosConstraintProto)
    encoded_size = 0
    !isempty(x.expressions) && (encoded_size += PB._encoded_size(x.expressions, 1))
    !isempty(x.weights) && (encoded_size += PB._encoded_size(x.weights, 2))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 3))
    return encoded_size
end

struct ObjectiveProto
    maximize::Bool
    offset::Float64
    linear_coefficients::Union{Nothing,SparseDoubleVectorProto}
    quadratic_coefficients::Union{Nothing,SparseDoubleMatrixProto}
    name::String
    priority::Int64
end
PB.default_values(::Type{ObjectiveProto}) = (;maximize = false, offset = zero(Float64), linear_coefficients = nothing, quadratic_coefficients = nothing, name = "", priority = zero(Int64))
PB.field_numbers(::Type{ObjectiveProto}) = (;maximize = 1, offset = 2, linear_coefficients = 3, quadratic_coefficients = 4, name = 5, priority = 6)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:ObjectiveProto})
    maximize = false
    offset = zero(Float64)
    linear_coefficients = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    quadratic_coefficients = Ref{Union{Nothing,SparseDoubleMatrixProto}}(nothing)
    name = ""
    priority = zero(Int64)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            maximize = PB.decode(d, Bool)
        elseif field_number == 2
            offset = PB.decode(d, Float64)
        elseif field_number == 3
            PB.decode!(d, linear_coefficients)
        elseif field_number == 4
            PB.decode!(d, quadratic_coefficients)
        elseif field_number == 5
            name = PB.decode(d, String)
        elseif field_number == 6
            priority = PB.decode(d, Int64)
        else
            PB.skip(d, wire_type)
        end
    end
    return ObjectiveProto(maximize, offset, linear_coefficients[], quadratic_coefficients[], name, priority)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::ObjectiveProto)
    initpos = position(e.io)
    x.maximize != false && PB.encode(e, 1, x.maximize)
    x.offset != zero(Float64) && PB.encode(e, 2, x.offset)
    !isnothing(x.linear_coefficients) && PB.encode(e, 3, x.linear_coefficients)
    !isnothing(x.quadratic_coefficients) && PB.encode(e, 4, x.quadratic_coefficients)
    !isempty(x.name) && PB.encode(e, 5, x.name)
    x.priority != zero(Int64) && PB.encode(e, 6, x.priority)
    return position(e.io) - initpos
end
function PB._encoded_size(x::ObjectiveProto)
    encoded_size = 0
    x.maximize != false && (encoded_size += PB._encoded_size(x.maximize, 1))
    x.offset != zero(Float64) && (encoded_size += PB._encoded_size(x.offset, 2))
    !isnothing(x.linear_coefficients) && (encoded_size += PB._encoded_size(x.linear_coefficients, 3))
    !isnothing(x.quadratic_coefficients) && (encoded_size += PB._encoded_size(x.quadratic_coefficients, 4))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 5))
    x.priority != zero(Int64) && (encoded_size += PB._encoded_size(x.priority, 6))
    return encoded_size
end

struct ModelProto
    name::String
    variables::Union{Nothing,VariablesProto}
    objective::Union{Nothing,ObjectiveProto}
    auxiliary_objectives::Dict{Int64,ObjectiveProto}
    linear_constraints::Union{Nothing,LinearConstraintsProto}
    linear_constraint_matrix::Union{Nothing,SparseDoubleMatrixProto}
    quadratic_constraints::Dict{Int64,QuadraticConstraintProto}
    second_order_cone_constraints::Dict{Int64,SecondOrderConeConstraintProto}
    sos1_constraints::Dict{Int64,SosConstraintProto}
    sos2_constraints::Dict{Int64,SosConstraintProto}
    indicator_constraints::Dict{Int64,IndicatorConstraintProto}
end
PB.default_values(::Type{ModelProto}) = (;name = "", variables = nothing, objective = nothing, auxiliary_objectives = Dict{Int64,ObjectiveProto}(), linear_constraints = nothing, linear_constraint_matrix = nothing, quadratic_constraints = Dict{Int64,QuadraticConstraintProto}(), second_order_cone_constraints = Dict{Int64,SecondOrderConeConstraintProto}(), sos1_constraints = Dict{Int64,SosConstraintProto}(), sos2_constraints = Dict{Int64,SosConstraintProto}(), indicator_constraints = Dict{Int64,IndicatorConstraintProto}())
PB.field_numbers(::Type{ModelProto}) = (;name = 1, variables = 2, objective = 3, auxiliary_objectives = 10, linear_constraints = 4, linear_constraint_matrix = 5, quadratic_constraints = 6, second_order_cone_constraints = 11, sos1_constraints = 7, sos2_constraints = 8, indicator_constraints = 9)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:ModelProto})
    name = ""
    variables = Ref{Union{Nothing,VariablesProto}}(nothing)
    objective = Ref{Union{Nothing,ObjectiveProto}}(nothing)
    auxiliary_objectives = Dict{Int64,ObjectiveProto}()
    linear_constraints = Ref{Union{Nothing,LinearConstraintsProto}}(nothing)
    linear_constraint_matrix = Ref{Union{Nothing,SparseDoubleMatrixProto}}(nothing)
    quadratic_constraints = Dict{Int64,QuadraticConstraintProto}()
    second_order_cone_constraints = Dict{Int64,SecondOrderConeConstraintProto}()
    sos1_constraints = Dict{Int64,SosConstraintProto}()
    sos2_constraints = Dict{Int64,SosConstraintProto}()
    indicator_constraints = Dict{Int64,IndicatorConstraintProto}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            name = PB.decode(d, String)
        elseif field_number == 2
            PB.decode!(d, variables)
        elseif field_number == 3
            PB.decode!(d, objective)
        elseif field_number == 10
            PB.decode!(d, auxiliary_objectives)
        elseif field_number == 4
            PB.decode!(d, linear_constraints)
        elseif field_number == 5
            PB.decode!(d, linear_constraint_matrix)
        elseif field_number == 6
            PB.decode!(d, quadratic_constraints)
        elseif field_number == 11
            PB.decode!(d, second_order_cone_constraints)
        elseif field_number == 7
            PB.decode!(d, sos1_constraints)
        elseif field_number == 8
            PB.decode!(d, sos2_constraints)
        elseif field_number == 9
            PB.decode!(d, indicator_constraints)
        else
            PB.skip(d, wire_type)
        end
    end
    return ModelProto(name, variables[], objective[], auxiliary_objectives, linear_constraints[], linear_constraint_matrix[], quadratic_constraints, second_order_cone_constraints, sos1_constraints, sos2_constraints, indicator_constraints)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::ModelProto)
    initpos = position(e.io)
    !isempty(x.name) && PB.encode(e, 1, x.name)
    !isnothing(x.variables) && PB.encode(e, 2, x.variables)
    !isnothing(x.objective) && PB.encode(e, 3, x.objective)
    !isempty(x.auxiliary_objectives) && PB.encode(e, 10, x.auxiliary_objectives)
    !isnothing(x.linear_constraints) && PB.encode(e, 4, x.linear_constraints)
    !isnothing(x.linear_constraint_matrix) && PB.encode(e, 5, x.linear_constraint_matrix)
    !isempty(x.quadratic_constraints) && PB.encode(e, 6, x.quadratic_constraints)
    !isempty(x.second_order_cone_constraints) && PB.encode(e, 11, x.second_order_cone_constraints)
    !isempty(x.sos1_constraints) && PB.encode(e, 7, x.sos1_constraints)
    !isempty(x.sos2_constraints) && PB.encode(e, 8, x.sos2_constraints)
    !isempty(x.indicator_constraints) && PB.encode(e, 9, x.indicator_constraints)
    return position(e.io) - initpos
end
function PB._encoded_size(x::ModelProto)
    encoded_size = 0
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 1))
    !isnothing(x.variables) && (encoded_size += PB._encoded_size(x.variables, 2))
    !isnothing(x.objective) && (encoded_size += PB._encoded_size(x.objective, 3))
    !isempty(x.auxiliary_objectives) && (encoded_size += PB._encoded_size(x.auxiliary_objectives, 10))
    !isnothing(x.linear_constraints) && (encoded_size += PB._encoded_size(x.linear_constraints, 4))
    !isnothing(x.linear_constraint_matrix) && (encoded_size += PB._encoded_size(x.linear_constraint_matrix, 5))
    !isempty(x.quadratic_constraints) && (encoded_size += PB._encoded_size(x.quadratic_constraints, 6))
    !isempty(x.second_order_cone_constraints) && (encoded_size += PB._encoded_size(x.second_order_cone_constraints, 11))
    !isempty(x.sos1_constraints) && (encoded_size += PB._encoded_size(x.sos1_constraints, 7))
    !isempty(x.sos2_constraints) && (encoded_size += PB._encoded_size(x.sos2_constraints, 8))
    !isempty(x.indicator_constraints) && (encoded_size += PB._encoded_size(x.indicator_constraints, 9))
    return encoded_size
end