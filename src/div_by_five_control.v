module control_div_by_five (
  input  logic clk,
  input  logic rst,
  input  logic all_z,
  input  logic in_val,

  output logic in_sel,
  output logic acc_sel,
  output logic c_sel,
  output logic in_rdy,
  output logic out_val
);
  logic [1:0] state;
  logic [1:0] next_state;

  localparam [1:0] IDLE = 2'b00;
  localparam [1:0] ACC = 2'b01;
  localparam [1:0] DONE = 2'b10;

  // output logic
  always_comb begin
    case (state)
      IDLE: begin
        in_sel = 1'b0;
        acc_sel = 1'b0;
        c_sel = 1'b0;
        in_rdy = 1'b1;
        out_val = 1'b0;
      end
      ACC: begin
        in_sel = 1'b1;
        acc_sel = 1'b1;
        c_sel = 1'b1;
        in_rdy = 1'b0;
        out_val = 1'b0;
      end
      DONE: begin
        in_sel = 1'b1;
        acc_sel = 1'b1;
        c_sel = 1'b1;
        in_rdy = 1'b0;
        out_val = 1'b1;
      end
      default: begin
        in_sel = 1'b0;
        acc_sel = 1'b0;
        c_sel = 1'b0;
        in_rdy = 1'b1;
        out_val = 1'b0;
      end
    endcase
  end

  // next state logic
  always_comb begin
    case (state)
      IDLE: begin
        if (in_val) begin
          next_state = ACC;
        end else begin
          next_state = IDLE;
        end
      end
      ACC: begin
        if (all_z) begin
          next_state = DONE;
        end else begin
          next_state = ACC;
        end
      end
      DONE: begin
        if (out_val) begin
          next_state = IDLE;
        end else begin
          next_state = DONE;
        end
      end
      default: next_state = state;
    endcase
  end

  // state advancement
  always_ff @(posedge clk) begin
    if (rst) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

endmodule