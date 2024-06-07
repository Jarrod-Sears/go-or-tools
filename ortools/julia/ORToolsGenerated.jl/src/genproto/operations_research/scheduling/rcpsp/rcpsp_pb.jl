# Autogenerated using ProtoBuf.jl v1.0.14 on 2024-01-02T18:44:47.161
# original file: /usr/local/google/home/tcuvelier/.julia/artifacts/cc3d5aa28fb2158ce4ff5aed9899545a37503a6b/include/ortools/scheduling/rcpsp/rcpsp.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export PerRecipeDelays, Recipe, Resource, RcpspAssignment, PerSuccessorDelays, Task
export RcpspProblem

struct PerRecipeDelays
    min_delays::Vector{Int32}
end
PB.default_values(::Type{PerRecipeDelays}) = (;min_delays = Vector{Int32}())
PB.field_numbers(::Type{PerRecipeDelays}) = (;min_delays = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:PerRecipeDelays})
    min_delays = PB.BufferedVector{Int32}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, min_delays)
        else
            PB.skip(d, wire_type)
        end
    end
    return PerRecipeDelays(min_delays[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::PerRecipeDelays)
    initpos = position(e.io)
    !isempty(x.min_delays) && PB.encode(e, 1, x.min_delays)
    return position(e.io) - initpos
end
function PB._encoded_size(x::PerRecipeDelays)
    encoded_size = 0
    !isempty(x.min_delays) && (encoded_size += PB._encoded_size(x.min_delays, 1))
    return encoded_size
end

struct Recipe
    duration::Int32
    demands::Vector{Int32}
    resources::Vector{Int32}
end
PB.default_values(::Type{Recipe}) = (;duration = zero(Int32), demands = Vector{Int32}(), resources = Vector{Int32}())
PB.field_numbers(::Type{Recipe}) = (;duration = 1, demands = 2, resources = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Recipe})
    duration = zero(Int32)
    demands = PB.BufferedVector{Int32}()
    resources = PB.BufferedVector{Int32}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            duration = PB.decode(d, Int32)
        elseif field_number == 2
            PB.decode!(d, wire_type, demands)
        elseif field_number == 3
            PB.decode!(d, wire_type, resources)
        else
            PB.skip(d, wire_type)
        end
    end
    return Recipe(duration, demands[], resources[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Recipe)
    initpos = position(e.io)
    x.duration != zero(Int32) && PB.encode(e, 1, x.duration)
    !isempty(x.demands) && PB.encode(e, 2, x.demands)
    !isempty(x.resources) && PB.encode(e, 3, x.resources)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Recipe)
    encoded_size = 0
    x.duration != zero(Int32) && (encoded_size += PB._encoded_size(x.duration, 1))
    !isempty(x.demands) && (encoded_size += PB._encoded_size(x.demands, 2))
    !isempty(x.resources) && (encoded_size += PB._encoded_size(x.resources, 3))
    return encoded_size
end

struct Resource
    max_capacity::Int32
    min_capacity::Int32
    renewable::Bool
    unit_cost::Int32
end
PB.default_values(::Type{Resource}) = (;max_capacity = zero(Int32), min_capacity = zero(Int32), renewable = false, unit_cost = zero(Int32))
PB.field_numbers(::Type{Resource}) = (;max_capacity = 1, min_capacity = 2, renewable = 3, unit_cost = 4)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Resource})
    max_capacity = zero(Int32)
    min_capacity = zero(Int32)
    renewable = false
    unit_cost = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            max_capacity = PB.decode(d, Int32)
        elseif field_number == 2
            min_capacity = PB.decode(d, Int32)
        elseif field_number == 3
            renewable = PB.decode(d, Bool)
        elseif field_number == 4
            unit_cost = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return Resource(max_capacity, min_capacity, renewable, unit_cost)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Resource)
    initpos = position(e.io)
    x.max_capacity != zero(Int32) && PB.encode(e, 1, x.max_capacity)
    x.min_capacity != zero(Int32) && PB.encode(e, 2, x.min_capacity)
    x.renewable != false && PB.encode(e, 3, x.renewable)
    x.unit_cost != zero(Int32) && PB.encode(e, 4, x.unit_cost)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Resource)
    encoded_size = 0
    x.max_capacity != zero(Int32) && (encoded_size += PB._encoded_size(x.max_capacity, 1))
    x.min_capacity != zero(Int32) && (encoded_size += PB._encoded_size(x.min_capacity, 2))
    x.renewable != false && (encoded_size += PB._encoded_size(x.renewable, 3))
    x.unit_cost != zero(Int32) && (encoded_size += PB._encoded_size(x.unit_cost, 4))
    return encoded_size
end

struct RcpspAssignment
    start_of_task::Vector{Int64}
    selected_recipe_of_task::Vector{Int32}
end
PB.default_values(::Type{RcpspAssignment}) = (;start_of_task = Vector{Int64}(), selected_recipe_of_task = Vector{Int32}())
PB.field_numbers(::Type{RcpspAssignment}) = (;start_of_task = 1, selected_recipe_of_task = 2)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:RcpspAssignment})
    start_of_task = PB.BufferedVector{Int64}()
    selected_recipe_of_task = PB.BufferedVector{Int32}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, start_of_task)
        elseif field_number == 2
            PB.decode!(d, wire_type, selected_recipe_of_task)
        else
            PB.skip(d, wire_type)
        end
    end
    return RcpspAssignment(start_of_task[], selected_recipe_of_task[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::RcpspAssignment)
    initpos = position(e.io)
    !isempty(x.start_of_task) && PB.encode(e, 1, x.start_of_task)
    !isempty(x.selected_recipe_of_task) && PB.encode(e, 2, x.selected_recipe_of_task)
    return position(e.io) - initpos
end
function PB._encoded_size(x::RcpspAssignment)
    encoded_size = 0
    !isempty(x.start_of_task) && (encoded_size += PB._encoded_size(x.start_of_task, 1))
    !isempty(x.selected_recipe_of_task) && (encoded_size += PB._encoded_size(x.selected_recipe_of_task, 2))
    return encoded_size
end

struct PerSuccessorDelays
    recipe_delays::Vector{PerRecipeDelays}
end
PB.default_values(::Type{PerSuccessorDelays}) = (;recipe_delays = Vector{PerRecipeDelays}())
PB.field_numbers(::Type{PerSuccessorDelays}) = (;recipe_delays = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:PerSuccessorDelays})
    recipe_delays = PB.BufferedVector{PerRecipeDelays}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, recipe_delays)
        else
            PB.skip(d, wire_type)
        end
    end
    return PerSuccessorDelays(recipe_delays[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::PerSuccessorDelays)
    initpos = position(e.io)
    !isempty(x.recipe_delays) && PB.encode(e, 1, x.recipe_delays)
    return position(e.io) - initpos
end
function PB._encoded_size(x::PerSuccessorDelays)
    encoded_size = 0
    !isempty(x.recipe_delays) && (encoded_size += PB._encoded_size(x.recipe_delays, 1))
    return encoded_size
end

struct Task
    successors::Vector{Int32}
    recipes::Vector{Recipe}
    successor_delays::Vector{PerSuccessorDelays}
end
PB.default_values(::Type{Task}) = (;successors = Vector{Int32}(), recipes = Vector{Recipe}(), successor_delays = Vector{PerSuccessorDelays}())
PB.field_numbers(::Type{Task}) = (;successors = 1, recipes = 2, successor_delays = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Task})
    successors = PB.BufferedVector{Int32}()
    recipes = PB.BufferedVector{Recipe}()
    successor_delays = PB.BufferedVector{PerSuccessorDelays}()
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, wire_type, successors)
        elseif field_number == 2
            PB.decode!(d, recipes)
        elseif field_number == 3
            PB.decode!(d, successor_delays)
        else
            PB.skip(d, wire_type)
        end
    end
    return Task(successors[], recipes[], successor_delays[])
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Task)
    initpos = position(e.io)
    !isempty(x.successors) && PB.encode(e, 1, x.successors)
    !isempty(x.recipes) && PB.encode(e, 2, x.recipes)
    !isempty(x.successor_delays) && PB.encode(e, 3, x.successor_delays)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Task)
    encoded_size = 0
    !isempty(x.successors) && (encoded_size += PB._encoded_size(x.successors, 1))
    !isempty(x.recipes) && (encoded_size += PB._encoded_size(x.recipes, 2))
    !isempty(x.successor_delays) && (encoded_size += PB._encoded_size(x.successor_delays, 3))
    return encoded_size
end

struct RcpspProblem
    resources::Vector{Resource}
    tasks::Vector{Task}
    is_consumer_producer::Bool
    is_resource_investment::Bool
    is_rcpsp_max::Bool
    deadline::Int32
    horizon::Int32
    release_date::Int32
    tardiness_cost::Int32
    mpm_time::Int32
    seed::Int64
    basedata::String
    due_date::Int32
    name::String
end
PB.default_values(::Type{RcpspProblem}) = (;resources = Vector{Resource}(), tasks = Vector{Task}(), is_consumer_producer = false, is_resource_investment = false, is_rcpsp_max = false, deadline = zero(Int32), horizon = zero(Int32), release_date = zero(Int32), tardiness_cost = zero(Int32), mpm_time = zero(Int32), seed = zero(Int64), basedata = "", due_date = zero(Int32), name = "")
PB.field_numbers(::Type{RcpspProblem}) = (;resources = 1, tasks = 2, is_consumer_producer = 3, is_resource_investment = 4, is_rcpsp_max = 5, deadline = 6, horizon = 7, release_date = 8, tardiness_cost = 9, mpm_time = 10, seed = 11, basedata = 12, due_date = 13, name = 14)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:RcpspProblem})
    resources = PB.BufferedVector{Resource}()
    tasks = PB.BufferedVector{Task}()
    is_consumer_producer = false
    is_resource_investment = false
    is_rcpsp_max = false
    deadline = zero(Int32)
    horizon = zero(Int32)
    release_date = zero(Int32)
    tardiness_cost = zero(Int32)
    mpm_time = zero(Int32)
    seed = zero(Int64)
    basedata = ""
    due_date = zero(Int32)
    name = ""
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            PB.decode!(d, resources)
        elseif field_number == 2
            PB.decode!(d, tasks)
        elseif field_number == 3
            is_consumer_producer = PB.decode(d, Bool)
        elseif field_number == 4
            is_resource_investment = PB.decode(d, Bool)
        elseif field_number == 5
            is_rcpsp_max = PB.decode(d, Bool)
        elseif field_number == 6
            deadline = PB.decode(d, Int32)
        elseif field_number == 7
            horizon = PB.decode(d, Int32)
        elseif field_number == 8
            release_date = PB.decode(d, Int32)
        elseif field_number == 9
            tardiness_cost = PB.decode(d, Int32)
        elseif field_number == 10
            mpm_time = PB.decode(d, Int32)
        elseif field_number == 11
            seed = PB.decode(d, Int64)
        elseif field_number == 12
            basedata = PB.decode(d, String)
        elseif field_number == 13
            due_date = PB.decode(d, Int32)
        elseif field_number == 14
            name = PB.decode(d, String)
        else
            PB.skip(d, wire_type)
        end
    end
    return RcpspProblem(resources[], tasks[], is_consumer_producer, is_resource_investment, is_rcpsp_max, deadline, horizon, release_date, tardiness_cost, mpm_time, seed, basedata, due_date, name)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::RcpspProblem)
    initpos = position(e.io)
    !isempty(x.resources) && PB.encode(e, 1, x.resources)
    !isempty(x.tasks) && PB.encode(e, 2, x.tasks)
    x.is_consumer_producer != false && PB.encode(e, 3, x.is_consumer_producer)
    x.is_resource_investment != false && PB.encode(e, 4, x.is_resource_investment)
    x.is_rcpsp_max != false && PB.encode(e, 5, x.is_rcpsp_max)
    x.deadline != zero(Int32) && PB.encode(e, 6, x.deadline)
    x.horizon != zero(Int32) && PB.encode(e, 7, x.horizon)
    x.release_date != zero(Int32) && PB.encode(e, 8, x.release_date)
    x.tardiness_cost != zero(Int32) && PB.encode(e, 9, x.tardiness_cost)
    x.mpm_time != zero(Int32) && PB.encode(e, 10, x.mpm_time)
    x.seed != zero(Int64) && PB.encode(e, 11, x.seed)
    !isempty(x.basedata) && PB.encode(e, 12, x.basedata)
    x.due_date != zero(Int32) && PB.encode(e, 13, x.due_date)
    !isempty(x.name) && PB.encode(e, 14, x.name)
    return position(e.io) - initpos
end
function PB._encoded_size(x::RcpspProblem)
    encoded_size = 0
    !isempty(x.resources) && (encoded_size += PB._encoded_size(x.resources, 1))
    !isempty(x.tasks) && (encoded_size += PB._encoded_size(x.tasks, 2))
    x.is_consumer_producer != false && (encoded_size += PB._encoded_size(x.is_consumer_producer, 3))
    x.is_resource_investment != false && (encoded_size += PB._encoded_size(x.is_resource_investment, 4))
    x.is_rcpsp_max != false && (encoded_size += PB._encoded_size(x.is_rcpsp_max, 5))
    x.deadline != zero(Int32) && (encoded_size += PB._encoded_size(x.deadline, 6))
    x.horizon != zero(Int32) && (encoded_size += PB._encoded_size(x.horizon, 7))
    x.release_date != zero(Int32) && (encoded_size += PB._encoded_size(x.release_date, 8))
    x.tardiness_cost != zero(Int32) && (encoded_size += PB._encoded_size(x.tardiness_cost, 9))
    x.mpm_time != zero(Int32) && (encoded_size += PB._encoded_size(x.mpm_time, 10))
    x.seed != zero(Int64) && (encoded_size += PB._encoded_size(x.seed, 11))
    !isempty(x.basedata) && (encoded_size += PB._encoded_size(x.basedata, 12))
    x.due_date != zero(Int32) && (encoded_size += PB._encoded_size(x.due_date, 13))
    !isempty(x.name) && (encoded_size += PB._encoded_size(x.name, 14))
    return encoded_size
end