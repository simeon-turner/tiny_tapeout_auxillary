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
  pass