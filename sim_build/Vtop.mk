# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Makefile for building Verilated archive or executable
#
# Execute this makefile from the object directory:
#    make -f Vtop.mk

default: adder

### Constants...
# Perl executable (from $PERL)
PERL = perl
# Path to Verilator kit (from $VERILATOR_ROOT)
VERILATOR_ROOT = /classes/c2s2/easybuild/software/verilator/4.036-GCCcore-13.2.0/share/verilator
# SystemC include directory with systemc.h (from $SYSTEMC_INCLUDE)
SYSTEMC_INCLUDE ?= 
# SystemC library directory with libsystemc.a (from $SYSTEMC_LIBDIR)
SYSTEMC_LIBDIR ?= 

### Switches...
# SystemC output mode?  0/1 (from --sc)
VM_SC = 0
# Legacy or SystemC output mode?  0/1 (from --sc)
VM_SP_OR_SC = $(VM_SC)
# Deprecated
VM_PCLI = 1
# Deprecated: SystemC architecture to find link library path (from $SYSTEMC_ARCH)
VM_SC_TARGET_ARCH = linux

### Vars...
# Design prefix (from --prefix)
VM_PREFIX = Vtop
# Module prefix (from --prefix)
VM_MODPREFIX = Vtop
# User CFLAGS (from -CFLAGS on Verilator command line)
VM_USER_CFLAGS = \

# User LDLIBS (from -LDFLAGS on Verilator command line)
VM_USER_LDLIBS = \
	-Wl,-rpath,/classes/c2s2/easybuild/software/C2S2PythonPackages/2024.02-foss-2023b/lib/python3.11/site-packages/cocotb/libs -L/classes/c2s2/easybuild/software/C2S2PythonPackages/2024.02-foss-2023b/lib/python3.11/site-packages/cocotb/libs -lcocotbvpi_verilator \

# User .cpp files (from .cpp's on Verilator command line)
VM_USER_CLASSES = \
	verilator \

# User .cpp directories (from .cpp's on Verilator command line)
VM_USER_DIR = \
	/classes/c2s2/easybuild/software/C2S2PythonPackages/2024.02-foss-2023b/lib/python3.11/site-packages/cocotb/share/lib/verilator \


### Default rules...
# Include list of all generated classes
include Vtop_classes.mk
# Include global rules
include $(VERILATOR_ROOT)/include/verilated.mk

### Executable rules... (from --exe)
VPATH += $(VM_USER_DIR)

verilator.o: /classes/c2s2/easybuild/software/C2S2PythonPackages/2024.02-foss-2023b/lib/python3.11/site-packages/cocotb/share/lib/verilator/verilator.cpp
	$(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(OPT_FAST) -c -o $@ $<

### Link rules... (from --exe)
adder: $(VK_USER_OBJS) $(VK_GLOBAL_OBJS) $(VM_PREFIX)__ALL.a
	$(LINK) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) $(LIBS) $(SC_LIBS) -o $@


# Verilated -*- Makefile -*-
