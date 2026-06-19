# IsleBridge Event-B Case Study

This directory contains the **Island-Bridge (IsleBridge)** Event-B case study used to evaluate the pattern-based refinement approach.

The case study is organised as a sequence of refinements, where each machine introduces additional functionality and constraints while preserving the correctness of the previous development through Event-B proof obligations.

## Contents

### Event-B Contexts

| File | Description |
|--------|-------------|
| `cColor.ctx` | Defines the color-related sets and constants used by the traffic light refinements. |
| `cCapacity.ctx` | Defines constants related to bridge and island capacity constraints. |

### Event-B Machines

| File | Description |
|--------|-------------|
| `m0_IsleAccess.mch` | Initial abstract model controlling access to the island. |
| `m1_IsleCapacity.mch` | Introduces island capacity constraints. |
| `m2_BridgeToIsle.mch` | Adds bridge-to-island movement behaviour. |
| `m3_TrafficLights.mch` | Introduces traffic-light control mechanisms. |
| `m4_Sensors.mch` | Adds sensor-based monitoring and control. |

Each `.mch` file corresponds to a complete Event-B machine generated after applying a pattern instance.

## Pattern Instances

The `.rpt` files contain pattern instantiations expressed using the pattern Domain Specific Language (DSL). The `.rpt` files represent the high-level specification of a pattern application, while the corresponding `.mch` files represent the generated Event-B refinements obtained after applying the transformation rules.


| File | Description |
|--------|-------------|
| `m1_IsleCapacity.rpt` | Pattern instance used to generate `m1_IsleCapacity.mch`. |
| `m2_BridgeToIsle.rpt` | Pattern instance used to generate `m2_BridgeToIsle.mch`. |
| `m3_TrafficLights.rpt` | Pattern instance used to generate `m3_TrafficLights.mch`. |
| `m4_Sensors.rpt` | Pattern instance used to generate `m4_Sensors.mch`. |


## Purpose

This case study serves as an evaluation benchmark for the pattern-based refinement approach. It illustrates how recurring refinement steps can be specified declaratively through pattern instances and automatically transformed into valid Event-B machines.

The generated models are subsequently verified using the standard Event-B proof obligation mechanism provided by the Rodin platform.
