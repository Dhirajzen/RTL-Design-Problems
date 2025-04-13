module clockDivider (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);

    logic cnt2;
    logic [1:0] cnt4;
    logic [3:0] cnt6;

    always @(posedge clk) begin
        if (!resetn) begin
            cnt2 <= 0;
            cnt4 <= 0;
            cnt6 <= 0;
        end else begin
            cnt2 <= cnt2 + 1;
            cnt4 <= cnt4 + 1;
            cnt6 <= (cnt6 + 1) % 6;
        end
    end

    assign div2 = (cnt2 == 1);
    assign div4 = (cnt4 == 1) || (cnt4 == 2);
    assign div6 = (cnt6 == 1) || (cnt6 == 2) || (cnt6 == 3);

endmodule