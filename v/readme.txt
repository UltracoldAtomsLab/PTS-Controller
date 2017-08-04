This folder contains several verilog HDL files that are serve as sub-module of sequence_extensions.
Notice: Several files are "not" being used in current version, including:
1. VJTAG.v
2. ext_code_32ch_256p.v
3. ext_code_32ch_8p.v
4. vJTAG_interface.v

The files being used by sequence_extensions.v are:
1. async_receiver.v
2. decoder.v
3. ptsController.v

The name of this folder should not be changed, otherwise you'll need to modify sequence_extension.qsf.
