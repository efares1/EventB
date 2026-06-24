# Part of Mechanical Press Event-B Case Study

This directory contains an refinement example inspired from the **Island-Bridge (IsleBridge)** Event-B case study used to evaluate the pattern-based refinement approach.

## Contents

### Event-B Machines

| File | Description |
|--------|-------------|
| `m0Root.mch` | Initial empty model  |
| `m1Door.rpt` | Pattern instance declaring button, door, motor and cluch. |
| `m1Door.mch` | Generated code containing one button, door, motor and cluch. |
| `m2Split.rpt` | Pattern instance declaring door/motor synchronization and separaing action/reaction. |
| `m2Split.mch` | Generated code containing door/motor synchronization. |

Each `.mch` file corresponds to a complete Event-B machine generated after applying a pattern instance.

## Pattern Instances

The `.rpt` files contain pattern instantiations expressed using the pattern Domain Specific Language (DSL). The `.rpt` files represent the high-level specification of a pattern application, while the corresponding `.mch` files represent the generated Event-B refinements obtained after applying the transformation rules.


| File | Description |
|--------|-------------|
| `m1Door.rpt` | Pattern instance used to generate `m1Door.mch` from counters, synchronizations and constraints. |


## Purpose

This case study serves as an evaluation benchmark for the pattern-based refinement approach. It illustrates how recurring refinement steps can be specified declaratively through pattern instances and automatically transformed into valid Event-B machines.

The generated models are subsequently verified using the standard Event-B proof obligation mechanism provided by the Rodin platform.
