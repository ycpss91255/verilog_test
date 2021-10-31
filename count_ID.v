module count_ID (
    input               iClk,
    input               iRst_n,
    output  reg [3:0]   oNum
  );
  reg    [3:0]    tmp;
  always @(posedge iClk or negedge iRst_n) begin
    if (!iRst_n) begin
      oNum <= 4'b0;
      tmp <= 4'b0;
    end
    else begin
      tmp <= (tmp >= 8) ? 0 : tmp + 1;
      case (tmp)
        4'd0: oNum <= 4'd8;
        4'd1: oNum <= 4'd1;
        4'd2: oNum <= 4'd0;
        4'd3: oNum <= 4'd4;
        4'd4: oNum <= 4'd4;
        4'd5: oNum <= 4'd0;
        4'd6: oNum <= 4'd0;
        4'd7: oNum <= 4'd2;
        4'd8: oNum <= 4'd3;
        default: oNum <= 4'd0;
      endcase
    end
  end
endmodule //count_ID
