\# Vector-V.1 — RV32I Single-Cycle RISC-V Processor (RTL from Scratch)



A modular, structural \*\*32-bit RISC-V (RV32I)\*\* processor designed from scratch in \*\*Verilog HDL\*\* without high-level behavioral shortcuts, verified using a self-checking scoreboard testbench in \*\*ModelSim\*\*.



\## Architecture Overview (V1.0)



Built following a strict structural modularity philosophy where datapath, control, and fetch units are isolated into clean, synthesizable Verilog modules:



```mermaid

flowchart LR

&#x20;   PC\[PC Register] --> IMEM\[Instruction Memory<br/>64x32-bit]

&#x20;   PC --> ADD4\[+4 Adder] --> PC

&#x20;   IMEM -->|instruction 31:0| CU\[Control Unit]

&#x20;   IMEM -->|rs1, rs2, rd| RF\[32x32 Register File<br/>Hardwired x0=0]

&#x20;   CU -->|RegWrite, ALUCtrl| RF

&#x20;   CU -->|ALUCtrl| ALU\[32-bit Structural ALU<br/>Two's Complement Sub]

&#x20;   RF -->|rd1, rd2| ALU

&#x20;   ALU -->|alu\_result\_out| RF

