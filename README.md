# 8-Bit CPU in SystemVerilog

An 8-bit CPU designed and implemented in SystemVerilog for the Terasic DE0-Nano FPGA.

The project explores processor architecture at RTL level, including the datapath, control logic, registers, ALU, memory and instruction execution.

## Architecture

* 8-bit datapath
* 8 general-purpose 8-bit registers
* 16-bit fixed-width instructions
* 8-bit program counter
* 256-word instruction memory
* 256-byte data memory
* Custom instruction set
* Conditional branching and jumping
* ALU supporting arithmetic, logic and shift operations

## Instruction Set

| Opcode | Instruction | Description           |
| ------ | ----------- | --------------------- |
| `0000` | `NOP`       | No operation          |
| `0001` | `LOADI`     | Load immediate value  |
| `0010` | `ADD`       | Addition              |
| `0011` | `SUB`       | Subtraction           |
| `0100` | `AND`       | Bitwise AND           |
| `0101` | `OR`        | Bitwise OR            |
| `0110` | `XOR`       | Bitwise XOR           |
| `0111` | `LOAD`      | Load from memory      |
| `1000` | `STORE`     | Store to memory       |
| `1001` | `JUMP`      | Unconditional jump    |
| `1010` | `BEQ`       | Branch if equal       |
| `1011` | `OUT`       | Output register value |
| `1100` | `NOT`       | Bitwise NOT           |
| `1101` | `SHL`       | Shift left            |
| `1110` | `SHR`       | Shift right           |

## Example

```text
LOADI R1, 10
LOADI R2, 20
ADD   R3, R1, R2
STORE R3, [100]
LOAD  R4, [100]
OUT   R4
```

This produces:

```text
R3 = 30
Memory[100] = 30
R4 = 30
Output = 30
```

## Verification

Individual modules and CPU functionality were tested using Questa/ModelSim.

Verified functionality includes:

* ALU: `ADD`, `SUB`, `AND`, `OR`, `XOR`, `NOT`, `SHL`, `SHR`
* `LOADI`
* `ADD`
* `STORE`
* `LOAD`
* `OUT`
* `JUMP`
* `BEQ` taken and not taken

## Project Structure

```text
FPGA-8bit-cpu/
├── alu.sv
├── register_file.sv
├── program_counter.sv
├── instruction_memory.sv
├── instruction_decoder.sv
├── control_unit.sv
├── writeback_mux.sv
├── data_memory.sv
├── cpu.sv
├── cpu_tb.sv
├── cpu_jump_tb.sv
├── cpu_beq_tb.sv
└── README.md
```

## Tools

* SystemVerilog
* Intel Quartus Prime
* Questa/ModelSim
* Git/GitHub
* Terasic DE0-Nano

## Future Work

* Build a Python assembler for the instruction set
* Load assembled programs into instruction memory
* Connect `OUT` to the DE0-Nano LEDs
* Run complete programs on the FPGA
* Expand the instruction set
