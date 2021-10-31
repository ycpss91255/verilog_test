module count_num (
    input               iClk,
    input               iRst_n,
    output  reg [3:0]   oNum
  );
  always @(posedge iClk or negedge iRst_n) begin
    if (!iRst_n) begin
      oNum <= 4'b0;
    end
    else oNum <= (oNum >= 9) ? 4'b0 : oNum + 1;
  end
endmodule //conut_num
