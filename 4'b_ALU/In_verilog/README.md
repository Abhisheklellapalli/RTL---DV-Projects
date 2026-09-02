4-bit ALU in Verilog
 Description
  This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL
  The ALU performs both arithmetic and logical operations on two 4-bit inputs
  Operation is selected using a 3-bit opcode
  Designed as a combinational circuit using always @(*) block
  Includes a carry-out (cout) flag for arithmetic operations
  Includes a zero flag that is set when the result is 0000
 Inputs
  a → 4-bit input operand A
  b → 4-bit input operand B
  opcode → 3-bit operation select signal
 Outputs
  result → 4-bit output of the selected operation
  cout → carry-out bit (valid during addition/subtraction)
  zero_flag → high when result = 0000
 Supported Operations
  000 → Addition (a + b)
  001 → Subtraction (a - b)
  010 → AND (a & b)
  011 → OR (a | b)
  100 → XOR (a ^ b)
  101 → NOT (~a)
  110 → NAND (~(a & b))
  111 → NOR (~(a | b))
 Design Highlights
  Uses a case statement to select operation based on opcode
  Uses always @(*) to ensure purely combinational logic
  cout is initialized to 0 by default to avoid unintended latch inference
  zero_flag is implemented using a continuous assignment (assign)
 Testbench
  Generates random values for a, b, and opcode using $urandom_range
  Runs 15 test iterations to validate multiple operations
  Uses $display to print results for each test case
  Includes $dumpfile and $dumpvars to enable waveform viewing
  Uses $finish to properly end simulation
 Tools Used
  Language: Verilog HDL
  Simulation & Waveform: EDA Playground (Icarus Verilog / EPWave)
  Synthesis: Yosys (via EDA Playground)
 How to Run
  Copy alu_4bit.v into the Design section on EDA Playground
  Copy alu_4bit_tb.v into the Testbench section
  Select a simulator (e.g., Icarus Verilog)
  Click Run to simulate
  Enable "Open EPWave after run" to view waveforms
