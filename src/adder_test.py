"""
The test file for adder.v
"""

import os
from pathlib import Path

import cocotb
from cocotb.triggers import Timer
from cocotb.runner import get_runner


@cocotb.test()
async def test_basic(dut):
  """
  A simple test for 1 + 1
  """
  dut.in0.value = 1
  dut.in1.value = 1
  dut.cin.value = 0

  expect_cout = 0
  expect_out = 2

  await Timer(2, units="ns")

  assert dut.out.value == expect_out, f"adder out is incorrect: {dut.out.value} != {expect_out}"
  assert dut.cout.value == expect_cout, f"adder cout is incorrect: {dut.cout.value} != {expect_cout}"
