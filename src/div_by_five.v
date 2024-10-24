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

    // 4-bit serializer
    always_ff @( posedge clk ) begin
    
    end

    // Sequential addition logic
    // sum the output of the 
    // Be sure to include nuance with carry out going to the same carry in

    wire [3:0] four_bit_sum;

    // 4-bit div by 5 logic
    assign divisible = ~(four_bit_sum[3] ^ four_bit_sum[1]) & 
                       ~(four_bit_sum[2] ^ four_bit_sum[0]);

endmodule

