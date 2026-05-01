# Lab 5: Basic CPU

VHDL for ECE 281 [Lab 5](https://usafa-ece.github.io/ece281-book/lab/lab5.html)

Targeted toward Digilent Basys3 with Viavdo 2024.2 on Windows 11.

---

## Build the project

You can simply open the `.xpr` and Vivado will do the rest!

## GitHub Actions Testbench

Will run **ALU_tb**

Doc Statement: Discussed implementation of ALU system for the and / or option / creating the flags for each condition.

Had a conversation with Gemini to fix a complicated bitstream error. It told me to use a synchronized clock in my controller_fsm, and that potentially my top_basys file had something uncommented (which it was), fixing the issue. https://gemini.google.com/app/b8b7a398e10d9a4e?is_sa=1&is_sa=1&android-min-version=301356232&ios-min-version=322.0&campaign_id=bkws&utm_source=sem&utm_medium=paid-media&utm_campaign=bkws&pt=9008&mt=8&ct=p-growth-sem-bkws&gclsrc=aw.ds&gad_source=1&gad_campaignid=20108148196&gbraid=0AAAAApk5BhkGRfyK_DWXNSNRu47zAbVmJ&gclid=Cj0KCQiAvtzLBhCPARIsALwhxdpguHvMa-Z-NyPLGjHl9JZomwg_iPEkGAVu7MthZ_W-JrZj3yBLI9UaAo6iEALw_wcB

Used code from various other labs/last year's GR2 to create my FSM and ALU.