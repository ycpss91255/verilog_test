module count_ID (
    input             iClk,
    input             iRst_n,
    output  reg [3:0] oNum
  );

  always @(posedge iClk or negedge iRst_n) begin
    if (!iRst_n) begin
      oNum <= 4'b0;
    end
    else begin
      oNum <= (oNum >= 8) ? 0 : oNum + 1;
    end
  end
endmodule //count_ID
