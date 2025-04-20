`include "full_adder.sv"
module RCA #(parameter
    DATA_WIDTH=8
) (
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum, //sum is one bit longer that DATA WIDTH to incorporate overflow/carryout
    output logic [DATA_WIDTH-1:0] cout_int
);

genvar i;
generate
    for(i=0; i < DATA_WIDTH; i++) begin
        if(i==0) begin //first FA block with cin = 0
            full_adder f(
                .a(a[i]),
                .b(b[i]),
                .cin(1'b0),
                .sum(sum[i]),
                .cout(cout_int[i])
            );
        end
        else begin // consequent FA blocks with cin = previous cout
            full_adder f(
                .a(a[i]),
                .b(b[i]),
                .cin(cout_int[i-1]),
                .sum(sum[i]),
                .cout(cout_int[i])
            );
        end
    end
endgenerate

assign sum[DATA_WIDTH] = cout_int[DATA_WIDTH-1]; //checking the overflow bit and setting it in the sum output

endmodule