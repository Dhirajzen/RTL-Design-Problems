module barrelShifter #(
    parameter N = 8
)(
    input  logic [N-1:0] data_in,
    input  logic [$clog2(N)-1:0] shift_amt,
    output logic [N-1:0] data_out
);

    // Intermediate stage outputs
    logic [N-1:0] stage [$clog2(N):0];

    assign stage[0] = data_in; // Initial input

    genvar i;
    generate
        for (i = 0; i < $clog2(N); i = i + 1) begin : shift_stage
            logic [N-1:0] shifted;
            
            // Shift left by 2^i
            assign shifted = stage[i] << (1 << i);

            // Use muxes for each bit
            always_comb begin
                for (int j = 0; j < N; j++) begin
                        stage[i+1][j] = shift_amt[i] ? shifted[j] : stage[i][j];
                end
            end
        end
    endgenerate

    assign data_out = stage[$clog2(N)];

endmodule
