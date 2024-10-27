"""
The test file for out divisible by five top level.
"""

import os
from pathlib import Path

import cocotb
from cocotb.triggers import Timer
from cocotb.runner import get_runner


cocotb.test()
async def test_basic(dut):
  """
  Basic test case to test that input number 5 is divisible by 5.
  """

  input = 5

  dut.value = input


def test_div_by_five_runner():
  """
  Runner for all test for our divisible by five detector
  """
  sim = os.getenv("SIM", "icarus")

  proj_path = Path(__file__).resolve().parent

  sources = [proj_path / src / "div_by_five.v"]

  runner = get_runner(sim)
  runner.build(
    sources=sources,
    hdl_toplevel="div_by_five",
  )

  runner.test(
    hdl_toplevel="div_by_five", 
    test_module="div_by_five_test,"
  )


if __name__ == "__main__":
  test_div_by_five_runner()