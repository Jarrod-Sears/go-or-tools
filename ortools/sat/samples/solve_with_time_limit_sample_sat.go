// Copyright 2010-2024 Google LLC
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// The solve_with_time_limit_sample_sat command is an example of setting a time limit on the model.
package main

import (
	"fmt"

	"github.com/golang/glog"
	"golang/protobuf/v2/proto/proto"
	cmpb "ortools/sat/cp_model_go_proto"
	"ortools/sat/go/cpmodel"
	sppb "ortools/sat/sat_parameters_go_proto"
)

func solveWithTimeLimitSampleSat() error {
	model := cpmodel.NewCpModelBuilder()

	domain := cpmodel.NewDomain(0, 2)
	x := model.NewIntVarFromDomain(domain).WithName("x")
	y := model.NewIntVarFromDomain(domain).WithName("y")
	z := model.NewIntVarFromDomain(domain).WithName("z")

	model.AddNotEqual(x, y)

	m, err := model.Model()
	if err != nil {
		return fmt.Errorf("failed to instantiate the CP model: %w", err)
	}

	// Sets a time limit of 10 seconds.
	params := sppb.SatParameters_builder{
		MaxTimeInSeconds: proto.Float64(10.0),
	}.Build()

	// Solve.
	response, err := cpmodel.SolveCpModelWithParameters(m, params)
	if err != nil {
		return fmt.Errorf("failed to solve the model: %w", err)
	}

	fmt.Printf("Status: %v\n", response.GetStatus())

	if response.GetStatus() == cmpb.CpSolverStatus_OPTIMAL {
		fmt.Printf(" x = %v\n", cpmodel.SolutionIntegerValue(response, x))
		fmt.Printf(" y = %v\n", cpmodel.SolutionIntegerValue(response, y))
		fmt.Printf(" z = %v\n", cpmodel.SolutionIntegerValue(response, z))
	}

	return nil
}

func main() {
	if err := solveWithTimeLimitSampleSat(); err != nil {
		glog.Exitf("solveWithTimeLimitSampleSat returned with error: %v", err)
	}
}