# Autogenerated using ProtoBuf.jl v1.0.14 on 2024-01-02T18:44:47.184
# original file: /usr/local/google/home/tcuvelier/.julia/artifacts/cc3d5aa28fb2158ce4ff5aed9899545a37503a6b/include/ortools/math_opt/solvers/glpk.proto (proto3 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export GlpkParametersProto

struct GlpkParametersProto
    compute_unbound_rays_if_possible::Bool
end
PB.default_values(::Type{GlpkParametersProto}) = (;compute_unbound_rays_if_possible = false)
PB.field_numbers(::Type{GlpkParametersProto}) = (;compute_unbound_rays_if_possible = 1)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:GlpkParametersProto})
    compute_unbound_rays_if_possible = false
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            compute_unbound_rays_if_possible = PB.decode(d, Bool)
        else
            PB.skip(d, wire_type)
        end
    end
    return GlpkParametersProto(compute_unbound_rays_if_possible)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::GlpkParametersProto)
    initpos = position(e.io)
    x.compute_unbound_rays_if_possible != false && PB.encode(e, 1, x.compute_unbound_rays_if_possible)
    return position(e.io) - initpos
end
function PB._encoded_size(x::GlpkParametersProto)
    encoded_size = 0
    x.compute_unbound_rays_if_possible != false && (encoded_size += PB._encoded_size(x.compute_unbound_rays_if_possible, 1))
    return encoded_size
end
