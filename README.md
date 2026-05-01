# Lab 5: Basic CPU

VHDL for ECE 281 [Lab 5](https://usafa-ece.github.io/ece281-book/lab/lab5.html)

Targeted toward Digilent Basys3 with Viavdo 2024.2 on Windows 11.

---

## Build the project

You can simply open the `.xpr` and Vivado will do the rest!

## GitHub Actions Testbench

Will run **ALU_tb**

Doc Statement: Discussed implementation of ALU system for the and / or option / creating the flags for each condition with C3C Eli Sakamoto.

Had a conversation with Gemini to fix a complicated bitstream error. It told me to use a synchronized clock in my controller_fsm, and that potentially my top_basys file had something uncommented. This was the error afer all, fixing the issue, but I still implemented the synchronized clock in my controller fsm. All this code was made myself with  its suggestions. https://gemini.google.com/share/013ecb41b5de

Used code from various other labs/last year's GR2 to create my FSM and ALU.