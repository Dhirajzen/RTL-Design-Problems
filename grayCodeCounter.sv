module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

logic [DATA_WIDTH-1:0] count;

always_ff @(posedge clk) begin
  if(!resetn) begin
    count <= 0;
  end
  else begin
    count += 1;
  end
end

assign out = (count>>1) ^ count; //binary-to-gray converting logic

endmodule