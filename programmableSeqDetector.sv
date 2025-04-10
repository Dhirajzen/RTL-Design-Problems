module programmableSeqDetector (
  input clk,
  input resetn,
  input [4:0] init, //pattern that's to be detected
  input din, //input bitstream
  output logic seen 
);

logic [4:0] cur, len, target;

always_ff @( posedge clk ) begin 
    if (!resetn) begin
        cur <= 0;
        len <= 0;
    end 
    else begin
        cur <= {cur[3:0], din}; //left shift and append din
        len <= (len<5) ? len+1 : len; //check if 5 bits are shifted into the shift register else increment the count.
    end
end

assign target = (resetn && len == 0) ? init : target; // set target value to init immediately after reset 
assign seen = (cur == target) && (len == 5); //check if count is 5 and if those 5 bits match the target sequence

endmodule