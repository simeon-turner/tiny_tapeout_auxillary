//=================================================================
// Divisible by Five Detector Top Module
//=================================================================

module div_by_five #(
    parameter BIT_WIDTH = 32;
) (
    input  logic                 clk,
    input  logic                 rst,
    input  logic [BIT_WIDTH-1:0] in,
    output logic                 divisible,
    output logic                 out_valid
);
    wire all_z;
    wire in_sel;
    wire acc_sel;
    wire c_sel;
    wire in_rdy;
    wire in_val;

    wire out_msg;

    datapth_div_by_five #(
        .BIT_WIDTH(BIT_WIDTH)
    ) datapth (
        .clk(clk),
        .rst(rst),
        .in_msg(in),
        .in_sel(in_sel),
        .acc_sel(acc_sel),
        .c_sel(c_sel),

        .all_z(all_z),
        .out_msg(out_msg)
    );

    control_div_by_five control (
        .clk(clk),
        .rst(rst),
        .all_z(all_z),
        .in_val(in_val),

        .in_sel(in_sel),
        .acc_sel(acc_sel),
        .c_sel(c_sel),
        .in_rdy(in_rdy),
        .out_val(out_valid)
    )

    // // assert that the bit width is divisible by 4. Bit width must be multiple of 4.

    // // 4-bit serializer
    // logic [BIT_WIDTH-1-8:0] data_register;

    // always_ff @( posedge clk ) begin                
    //     if ( rst )
    //         data_register <= 0;
    //     else if ( data_register == 0 && carry_register == 0 ) begin
    //         data_register <= in[BIT_WIDTH-1:8];
    //     end else begin
    //         data_register <= {4'b0, data_register[BIT_WIDTH-1-8:4]};
    //     end

    // end

    // // Sequential addition logic
    // // sum the output of the 
    // // Be sure to include nuance with carry out going to the same carry in

    // logic      carry_register;  // register that stores carry bit
    // wire [3:0] four_bit_sum;    // accumulator of 4-bit wide sum of input

    // // 4-bit div by 5 logic
    // assign divisible = ~(four_bit_sum[3] ^ four_bit_sum[1]) & 
    //                    ~(four_bit_sum[2] ^ four_bit_sum[0]);

endmodule

