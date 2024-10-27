module datapth_div_by_five #(
  parameter BIT_WIDTH = 32
) (
  input  logic clk,
  input  logic rst,
  input  logic [BIT_WIDTH - 1:0] in_msg,
  input  logic in_sel,
  input  logic acc_sel,
  input  logic c_sel,

  output logic all_z,
  output logic out_msg
);
  // matching patterns
  localparam [3:0] MATCH1 = 4'b0000;
  localparam [3:0] MATCH2 = 4'b0101;
  localparam [3:0] MATCH3 = 4'b1010;
  localparam [3:0] MATCH4 = 4'b1111;

  // shift
  wire [BIT_WIDTH - 10] check_out;
  wire [BIT_WIDTH - 1:0] check_in;
  wire [BIT_WIDTH - 1:0] check_out_shifted;

  Mux_2b in_mux (
    .in0(in_msg),
    .in1(check_out_shifted),
    .sel(in_sel),
    .out(check_in)
  );

  Reg_Nb #(
    .BIT_WIDTH(BIT_WIDTH)
  ) reg (
    .clk(clk),
    .rst(rst),
    .in(check_in),
    .out(check_out)
  );

  assign check_out_shifted = check_out >> 4;

  // add
  wire [3:0] acc_out;
  wire cout;
  wire cin;
  wire cout_out;
  wire [3:0] acc;

  Adder_Nb #(
    .BIT_WIDTH(4)
  ) adder (
    .in0(check_out[3:0]),
    .in1(acc_out),
    .cin(cin),
    .out(acc),
    .cout(cout)
  );

  Reg_Nb #(
    .BIT_WIDTH(1)
  ) c_reg (
    .clk(clk),
    .rst(rst),
    .in(cout),
    .out(cout_out)
  )

  Mux_2b c_mux (
    .in0(1'b0),
    .in1(cout_out),
    .sel(c_sel),
    .out(cin)
  );

  // accumulator
  Mux_2b acc_mux (
    .in0(4'b0),
    .in1(acc),
    .sel(acc_sel),
    .out(acc_in)
  );

  Reg_Nb #(
    .BIT_WIDTH(4)
  ) acc_reg (
    .clk(clk),
    .rst(rst),
    .in(acc_in),
    .out(acc_out)
  );

  // to control
  assign all_z = (check_out_shifted == 8'b0);

  // output
  assign out_msg = (acc == MATCH1) || (acc == MATCH2) || (acc == MATCH3) || (acc == MATCH4);

endmodule