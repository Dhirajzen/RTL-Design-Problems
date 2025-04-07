module fizzBuzzModulo #(parameter
    FIZZ=3,
    BUZZ=5,
    MAX_CYCLES=100
) (
    input clk,
    input resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);

logic [$clog2(MAX_CYCLES)-1 : 0] count;

always_ff @(posedge clk) begin
    if(!resetn) begin
        count <= 0;
    end
    else begin
        count <= (count == MAX_CYCLES - 1) ? 0 : count + 1;
    end
end

assign fizz = (count % FIZZ == 0);
assign buzz = (count % BUZZ == 0);
assign fizzbuzz = fizz & buzz;


endmodule