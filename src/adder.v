module Adder_Nb #(
  parameter BIT_WIDTH = 32
) (
  input  logic [BIT_WIDTH - 1:0] in0,
  input  logic [BIT_WIDTH - 1:0] in1,
  input  logic cin,
  output logic [BIT_WIDTH - 1:0] out,
  output logic  cout
);
  assign {cout, out} = in0 + in1 + cin;
endmodule