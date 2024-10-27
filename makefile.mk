# this is a makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

VERILOG_SOURCES += $(PWD)/src/div_by_five.v
#VERILOG_SOURCES += /home/smt259/c2s2/tiny_tapeout_auxillary/src/div_by_five.v

# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = div_by_five

# MODULE is the basename of the Python test file
#MODULE = div_by_five_test

COCOTB_TOPLEVEL     := div_by_five
COCOTB_TEST_MODULES := div_by_five_test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim