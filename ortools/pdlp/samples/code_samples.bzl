# Copyright 2010-2024 Google LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Helper macro to compile and test code samples."""

def code_sample_cc(name):
    native.cc_binary(
        name = name + "_cc",
        srcs = [name + ".cc"],
        deps = [
            "//ortools/base",
            "//ortools/pdlp:iteration_stats",
            "//ortools/pdlp:primal_dual_hybrid_gradient",
            "//ortools/pdlp:quadratic_program",
            "//ortools/pdlp:solve_log_cc_proto",
            "//ortools/pdlp:solvers_cc_proto",
            "@eigen//:eigen3",
        ],
    )

    native.cc_test(
        name = name + "_cc_test",
        size = "small",
        srcs = [name + ".cc"],
        deps = [
            ":" + name + "_cc",
            "//ortools/base",
            "//ortools/pdlp:iteration_stats",
            "//ortools/pdlp:primal_dual_hybrid_gradient",
            "//ortools/pdlp:quadratic_program",
            "//ortools/pdlp:solve_log_cc_proto",
            "//ortools/pdlp:solvers_cc_proto",
            "@eigen//:eigen3",
        ],
    )