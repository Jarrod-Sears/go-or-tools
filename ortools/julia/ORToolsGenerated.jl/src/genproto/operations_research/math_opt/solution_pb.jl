# Autogenerated using ProtoBuf.jl v1.0.14 on 2024-01-02T18:44:47.187
# original file: /usr/local/google/home/tcuvelier/.julia/artifacts/cc3d5aa28fb2158ce4ff5aed9899545a37503a6b/include/ortools/math_opt/solution.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export PrimalRayProto, SolutionStatusProto, BasisStatusProto, DualRayProto
export PrimalSolutionProto, DualSolutionProto, SparseBasisStatusVector, BasisProto
export SolutionProto

struct PrimalRayProto
    variable_values::Union{Nothing,SparseDoubleVectorProto}
end
PB.default_values(::Type{PrimalRayProto}) = (;variable_values = nothing)
PB.field_numbers(::Type{PrimalRayProto}) = (;variable_values = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:PrimalRayProto})
    variable_values = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, variable_values)
        else
            PB.skip(d, wire_type)
        end
    end
    return PrimalRayProto(variable_values[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::PrimalRayProto)
    initpos = position(e.io)
    !isnothing(x.variable_values) && PB.encode(e, 1, x.variable_values)
    return position(e.io) - initpos
end
function PB._encoded_size(x::PrimalRayProto)
    encoded_size = 0
    !isnothing(x.variable_values) && (encoded_size += PB._encoded_size(x.variable_values, 1))
    return encoded_size
end

@enumx SolutionStatusProto SOLUTION_STATUS_UNSPECIFIED=0 SOLUTION_STATUS_UNDETERMINED=1 SOLUTION_STATUS_FEASIBLE=2 SOLUTION_STATUS_INFEASIBLE=3

@enumx BasisStatusProto BASIS_STATUS_UNSPECIFIED=0 BASIS_STATUS_FREE=1 BASIS_STATUS_AT_LOWER_BOUND=2 BASIS_STATUS_AT_UPPER_BOUND=3 BASIS_STATUS_FIXED_VALUE=4 BASIS_STATUS_BASIC=5

struct DualRayProto
    dual_values::Union{Nothing,SparseDoubleVectorProto}
    reduced_costs::Union{Nothing,SparseDoubleVectorProto}
end
PB.default_values(::Type{DualRayProto}) = (;dual_values = nothing, reduced_costs = nothing)
PB.field_numbers(::Type{DualRayProto}) = (;dual_values = 1, reduced_costs = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DualRayProto})
    dual_values = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    reduced_costs = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, dual_values)
        elseif field_number == 2
            PB.decode!(d, reduced_costs)
        else
            PB.skip(d, wire_type)
        end
    end
    return DualRayProto(dual_values[], reduced_costs[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DualRayProto)
    initpos = position(e.io)
    !isnothing(x.dual_values) && PB.encode(e, 1, x.dual_values)
    !isnothing(x.reduced_costs) && PB.encode(e, 2, x.reduced_costs)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DualRayProto)
    encoded_size = 0
    !isnothing(x.dual_values) && (encoded_size += PB._encoded_size(x.dual_values, 1))
    !isnothing(x.reduced_costs) && (encoded_size += PB._encoded_size(x.reduced_costs, 2))
    return encoded_size
end

struct PrimalSolutionProto
    variable_values::Union{Nothing,SparseDoubleVectorProto}
    objective_value::Float64
    auxiliary_objective_values::Dict{Int64,Float64}
    feasibility_status::SolutionStatusProto.T
end
PB.default_values(::Type{PrimalSolutionProto}) = (;variable_values = nothing, objective_value = zero(Float64), auxiliary_objective_values = Dict{Int64,Float64}(), feasibility_status = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED)
PB.field_numbers(::Type{PrimalSolutionProto}) = (;variable_values = 1, objective_value = 2, auxiliary_objective_values = 4, feasibility_status = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:PrimalSolutionProto})
    variable_values = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    objective_value = zero(Float64)
    auxiliary_objective_values = Dict{Int64,Float64}()
    feasibility_status = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, variable_values)
        elseif field_number == 2
            objective_value = PB.decode(d, Float64)
        elseif field_number == 4
            PB.decode!(d, auxiliary_objective_values)
        elseif field_number == 3
            feasibility_status = PB.decode(d, SolutionStatusProto.T)
        else
            PB.skip(d, wire_type)
        end
    end
    return PrimalSolutionProto(variable_values[], objective_value, auxiliary_objective_values, feasibility_status)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::PrimalSolutionProto)
    initpos = position(e.io)
    !isnothing(x.variable_values) && PB.encode(e, 1, x.variable_values)
    x.objective_value != zero(Float64) && PB.encode(e, 2, x.objective_value)
    !isempty(x.auxiliary_objective_values) && PB.encode(e, 4, x.auxiliary_objective_values)
    x.feasibility_status != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && PB.encode(e, 3, x.feasibility_status)
    return position(e.io) - initpos
end
function PB._encoded_size(x::PrimalSolutionProto)
    encoded_size = 0
    !isnothing(x.variable_values) && (encoded_size += PB._encoded_size(x.variable_values, 1))
    x.objective_value != zero(Float64) && (encoded_size += PB._encoded_size(x.objective_value, 2))
    !isempty(x.auxiliary_objective_values) && (encoded_size += PB._encoded_size(x.auxiliary_objective_values, 4))
    x.feasibility_status != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && (encoded_size += PB._encoded_size(x.feasibility_status, 3))
    return encoded_size
end

struct DualSolutionProto
    dual_values::Union{Nothing,SparseDoubleVectorProto}
    reduced_costs::Union{Nothing,SparseDoubleVectorProto}
    objective_value::Float64
    feasibility_status::SolutionStatusProto.T
end
PB.default_values(::Type{DualSolutionProto}) = (;dual_values = nothing, reduced_costs = nothing, objective_value = zero(Float64), feasibility_status = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED)
PB.field_numbers(::Type{DualSolutionProto}) = (;dual_values = 1, reduced_costs = 2, objective_value = 3, feasibility_status = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:DualSolutionProto})
    dual_values = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    reduced_costs = Ref{Union{Nothing,SparseDoubleVectorProto}}(nothing)
    objective_value = zero(Float64)
    feasibility_status = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, dual_values)
        elseif field_number == 2
            PB.decode!(d, reduced_costs)
        elseif field_number == 3
            objective_value = PB.decode(d, Float64)
        elseif field_number == 4
            feasibility_status = PB.decode(d, SolutionStatusProto.T)
        else
            PB.skip(d, wire_type)
        end
    end
    return DualSolutionProto(dual_values[], reduced_costs[], objective_value, feasibility_status)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::DualSolutionProto)
    initpos = position(e.io)
    !isnothing(x.dual_values) && PB.encode(e, 1, x.dual_values)
    !isnothing(x.reduced_costs) && PB.encode(e, 2, x.reduced_costs)
    x.objective_value != zero(Float64) && PB.encode(e, 3, x.objective_value)
    x.feasibility_status != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && PB.encode(e, 4, x.feasibility_status)
    return position(e.io) - initpos
end
function PB._encoded_size(x::DualSolutionProto)
    encoded_size = 0
    !isnothing(x.dual_values) && (encoded_size += PB._encoded_size(x.dual_values, 1))
    !isnothing(x.reduced_costs) && (encoded_size += PB._encoded_size(x.reduced_costs, 2))
    x.objective_value != zero(Float64) && (encoded_size += PB._encoded_size(x.objective_value, 3))
    x.feasibility_status != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && (encoded_size += PB._encoded_size(x.feasibility_status, 4))
    return encoded_size
end

struct SparseBasisStatusVector
    ids::Vector{Int64}
    values::Vector{BasisStatusProto.T}
end
PB.default_values(::Type{SparseBasisStatusVector}) = (;ids = Vector{Int64}(), values = Vector{BasisStatusProto.T}())
PB.field_numbers(::Type{SparseBasisStatusVector}) = (;ids = 1, values = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SparseBasisStatusVector})
    ids = PB.BufferedVector{Int64}()
    values = PB.BufferedVector{BasisStatusProto.T}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, ids)
        elseif field_number == 2
            PB.decode!(d, wire_type, values)
        else
            PB.skip(d, wire_type)
        end
    end
    return SparseBasisStatusVector(ids[], values[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SparseBasisStatusVector)
    initpos = position(e.io)
    !isempty(x.ids) && PB.encode(e, 1, x.ids)
    !isempty(x.values) && PB.encode(e, 2, x.values)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SparseBasisStatusVector)
    encoded_size = 0
    !isempty(x.ids) && (encoded_size += PB._encoded_size(x.ids, 1))
    !isempty(x.values) && (encoded_size += PB._encoded_size(x.values, 2))
    return encoded_size
end

struct BasisProto
    constraint_status::Union{Nothing,SparseBasisStatusVector}
    variable_status::Union{Nothing,SparseBasisStatusVector}
    basic_dual_feasibility::SolutionStatusProto.T
end
PB.default_values(::Type{BasisProto}) = (;constraint_status = nothing, variable_status = nothing, basic_dual_feasibility = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED)
PB.field_numbers(::Type{BasisProto}) = (;constraint_status = 1, variable_status = 2, basic_dual_feasibility = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:BasisProto})
    constraint_status = Ref{Union{Nothing,SparseBasisStatusVector}}(nothing)
    variable_status = Ref{Union{Nothing,SparseBasisStatusVector}}(nothing)
    basic_dual_feasibility = SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, constraint_status)
        elseif field_number == 2
            PB.decode!(d, variable_status)
        elseif field_number == 3
            basic_dual_feasibility = PB.decode(d, SolutionStatusProto.T)
        else
            PB.skip(d, wire_type)
        end
    end
    return BasisProto(constraint_status[], variable_status[], basic_dual_feasibility)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::BasisProto)
    initpos = position(e.io)
    !isnothing(x.constraint_status) && PB.encode(e, 1, x.constraint_status)
    !isnothing(x.variable_status) && PB.encode(e, 2, x.variable_status)
    x.basic_dual_feasibility != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && PB.encode(e, 3, x.basic_dual_feasibility)
    return position(e.io) - initpos
end
function PB._encoded_size(x::BasisProto)
    encoded_size = 0
    !isnothing(x.constraint_status) && (encoded_size += PB._encoded_size(x.constraint_status, 1))
    !isnothing(x.variable_status) && (encoded_size += PB._encoded_size(x.variable_status, 2))
    x.basic_dual_feasibility != SolutionStatusProto.SOLUTION_STATUS_UNSPECIFIED && (encoded_size += PB._encoded_size(x.basic_dual_feasibility, 3))
    return encoded_size
end

struct SolutionProto
    primal_solution::Union{Nothing,PrimalSolutionProto}
    dual_solution::Union{Nothing,DualSolutionProto}
    basis::Union{Nothing,BasisProto}
end
PB.default_values(::Type{SolutionProto}) = (;primal_solution = nothing, dual_solution = nothing, basis = nothing)
PB.field_numbers(::Type{SolutionProto}) = (;primal_solution = 1, dual_solution = 2, basis = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:SolutionProto})
    primal_solution = Ref{Union{Nothing,PrimalSolutionProto}}(nothing)
    dual_solution = Ref{Union{Nothing,DualSolutionProto}}(nothing)
    basis = Ref{Union{Nothing,BasisProto}}(nothing)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, primal_solution)
        elseif field_number == 2
            PB.decode!(d, dual_solution)
        elseif field_number == 3
            PB.decode!(d, basis)
        else
            PB.skip(d, wire_type)
        end
    end
    return SolutionProto(primal_solution[], dual_solution[], basis[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::SolutionProto)
    initpos = position(e.io)
    !isnothing(x.primal_solution) && PB.encode(e, 1, x.primal_solution)
    !isnothing(x.dual_solution) && PB.encode(e, 2, x.dual_solution)
    !isnothing(x.basis) && PB.encode(e, 3, x.basis)
    return position(e.io) - initpos
end
function PB._encoded_size(x::SolutionProto)
    encoded_size = 0
    !isnothing(x.primal_solution) && (encoded_size += PB._encoded_size(x.primal_solution, 1))
    !isnothing(x.dual_solution) && (encoded_size += PB._encoded_size(x.dual_solution, 2))
    !isnothing(x.basis) && (encoded_size += PB._encoded_size(x.basis, 3))
    return encoded_size
end