# this is a makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += ./adder.v
#VERILOG_SOURCES += ./mux.v
#VERILOG_SOURCES += ./reg.v
#VERILOG_SOURCES += ./div_by_five_control.v
#VERILOG_SOURCES += ./div_by_five_datapath.v
#VERILOG_SOURCES += ./div_by_five.v

VERILOG_INCLUDE_DIRS += ../

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
# MODULE is the basename of the Python test file
TOP ?= adder

ifeq ($(TOP), adder)
	TOPLEVEL = Adder_Nb
	MODULE = adder_test
else ifeq ($(TOP), mux)
	TOPLEVEL = Mux_2b
	MODULE = mux_test
else ifeq ($(TOP), reg)
	TOPLEVEL = reg
	MODULE = reg_test
else ifeq ($(TOP), div_by_five_control)
	TOPLEVEL = div_by_five_control
	MODULE = div_by_five_control_test
else ifeq ($(TOP), div_by_five_datapath)
	TOPLEVEL = div_by_five_datapath
	MODULE = div_by_five_datapath_test
else ifeq ($(TOP), div_by_five)
	TOPLEVEL = div_by_five
	MODULE = div_by_five_test
else
	$(error Unsupported TOP specified. Please specify a valid TOP module.)
endif

# send test build outputs to build folder
SIM_BUILD = ../build/$(TOP)
COCOTB_RESULTS_FILE = ../build/$(TOP)/results.xml

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim


# Additional functionilty to the Makefile
hello:
	@echo "Hello world"

clean::
	@echo "Cleaning build"
	rm -f -r ../build/adder/
	rm -f -r ../build/mux/
	rm -f -r ../build/reg/
	rm -f -r ../build/div_by_five_control/
	rm -f -r ../build/div_by_five_datapath/
	rm -f -r ../build/div_by_five/
	