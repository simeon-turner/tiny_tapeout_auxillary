"""
The test file for adder.v
"""

import os
from pathlib import Path

import cocotb
from cocotb.triggers import Timer
from cocotb.runner import get_runner


cocotb.test()
async def test_test():
  """
  Empty test
  """
  dut.in0.value = 1
  dut.in1.value = 1
  dut.cin.value = 0

  expect_cout = 0
  expect_out = 2

  await Time(1, units="ns")

  assert dut.out.value == expect_out, f"adder result is incorrect: {dut.out.value} != {expect_out}"
  assert dut.cout.value == expect_cout, f"adder result is incorrect: {dut.cout.value} != {expect_cout}"
