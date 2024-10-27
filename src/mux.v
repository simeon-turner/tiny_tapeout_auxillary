module Mux_2b 
(
  input logic in0,
  input logic in1,
  input logic sel,
  output logic out
);
  assign out = sel ? in1 : in0;

endmodule