module hex_count (
  input            iClk,
  input            iRst_n,
  output reg [3:0] oNum
);

reg [3:0] count;

  always @ ( posedge iClk, negedge iRst_n ) begin
    if ( !iRst_n )begin
      count <= 4'b0;
    end else begin
      count = count + 1;
      case (count)
        4'd1: oNum = 4'd8;
        4'd2: oNum = 4'd1;
        4'd3: oNum = 4'd0;
        4'd4: oNum = 4'd4;
        4'd5: oNum = 4'd4;
        4'd6: oNum = 4'd0;
        4'd7: oNum = 4'd0;
        4'd8: oNum = 4'd2;
        4'd9: oNum = 4'd3;
        4'd10: oNum = 4'd6;
        4'd11: oNum = 4'd9;
        4'd12: begin
          count = 4'b0;
          oNum = 4'd3;
        end
        default: begin
          count = 4'b0;
          oNum = count;
        end
      endcase
    end
  end
endmodule
