module Reg_Nb #(
  parameter BIT_WIDTH = 32
) (
  input  logic clk,
  input  logic rst,
  input  logic [BIT_WIDTH - 1:0] in,
  output logic [BIT_WIDTH - 1:0] out
);
  logic [BIT_WIDTH - 1:0] data_register;

  always_ff @( posedge clk ) begin                
    if ( rst )
      data_register <= 0;
    else
      data_register <= in;
  end

  assign out = data_register;

endmodule