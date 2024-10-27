module adder #(
  BIT_WIDTH = 4
) (
  input logic [BIT_WIDTH-1:0] in0,
  input logic [BIT_WIDTH-1:0] in1,
  output logic [BIT_WIDTH-1:0] out
);

  always_comb begin
    out = in0 + in1;
  end
  
endmodule

