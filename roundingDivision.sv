module roundDivision #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);

logic [OUT_WIDTH:0] temp;

//temp = right shifted value for div + reminder msb
assign temp = din[IN_WIDTH-1:DIV_LOG2] + din[DIV_LOG2-1];   

//check for overflow and decide whether to saturate the result or give the rounded off result
assign dout = temp[OUT_WIDTH] ? din[IN_WIDTH-1:DIV_LOG2] : temp[OUT_WIDTH-1:0];     

endmodule