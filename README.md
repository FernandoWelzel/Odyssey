# Introduction

This project comprises the a simple fault-tollerant RISC-V processor for the use in space applications.

# Architecture

![plot](./docs/architecure.png)

# Planning

- [ ] Understand basicaly how it works
    - [ ] Process architecture
        - [ ] Fetch
        - [ ] Decode
        - [ ] ALU
        - [ ] Registe file
        - [ ] LSU (Load-Store-Unit)
    - [ ] Error correction architecture
        - [ ] Encoder and decoder
        - [ ] TMR
    - [ ] RISC-V ISA
    - [ ] OpenSource EDA tools
        - [ ] Simulation
            - [ ] Icarus Verilog
        - [ ] Synthesis
            - [ ] Yosis
        - [ ] P&R

- [ ] Decision phase
    - [ ] # bits
    - [ ] Size of register file
    - [ ] Number of instructions
        - [ ] Which instructions

Tools and project organization:

- I would like the project to be well organized with everything that I have learned until the moment. I believe it would be in my interest if I tried to make the project compatible with Open source EDA tools. The problem is that I don't know which tools to use really. So to start it I would need to learn which tools to use. I believe I should do that before starting the project.
- Maybe it would be wise to set everything up in a docker container for things to be organized.
- Another question is if REALLY be using SystemVerilog for this project (since I'm starting to hate it)

# Study

RISC-V ISA: STOPPED at page 26 !!!

- The most basic RISC-V ISA is the RV32I, that deals with 32 bits integers. It contains 47 instructions but it can be reduced to 38 in simple implementations. This ISA specifies 32 registers but the first one is connected directed to ground. Apart from this register there is the PC (program counter), which also has 32 bits.
- Instructions can be from the R, I, S, B, U or J type. The full specification can be seen in page 23 of the specification.
    - Each instruction type has a specific configuration of bits that has to be respected. The instructions that posses immediate values should be attended to given that they produce different immediates according to the instruction type.
    - I can't yet see the reason of the B type instruction for example. I believe it has something to do with even numbers but I don't know what.
- Arithmetic overflows are normally ignored in the base instruction set. Overflows can be checked using a simple branch instruction.
- Immediate instructions:
    * ADDI rd, rs1, imm - Stands for add immediate. Can also be used to move a value.
    * SLTI rd, rs1, imm - Stands for Set Less Than Immediate. Places 1 in rd if rs1 is less than immediate. Signed versions of the numbers should be compared.
    * SLTIU rd, rs1, imm - Same thing as SLTI but numbers are compared as unsigned values. The immediate should be first sign-extended and then treated as an unsigned number.
    * ANDI - ORI - XORI - Perform usual AND, OR and XOR operations with immediate sign extended values. XORI can be use to perform a NOT operation in a register.
    * SLLI - SRLI - SRAI - Shifts by a constant amount.
    * LUI rd, imm - Load Upper Immediate - Loads the contents of the immediate in to the register of destination, putting zeros on the rest.
    * AUIPC rd, imm - Add upper immediate to PC - Adds the value of the immediate followed by zeros to the program counter. It doens't make

# Work

- 17/08/2023 - 2:03 - Started project. Studied about the RISC-V ISA. Most of the time not computed.
- 18/08/2023 - 1:00 - Created a template repository for SystemVerilog based projects. Tough about how to continue the project using OpenSource EDA tools.