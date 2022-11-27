module hex_count_RL (
  input      [2:0] iClk,
  input      [2:0] iSW,
  input            iRst_n,
  output reg [3:0] oNum
);

reg [3:0] count;
reg rClk;

  always @ ( iSW ) begin
    case(iSW[1:0])
      2'b01: rClk <= iClk[0];
      2'b10: rClk <= iClk[1];
      2'b11: rClk <= iClk[2];
      default: rClk <= 1'b00;
    endcase
  end

  always @ ( posedge rClk, negedge iRst_n ) begin
    if ( !iRst_n )begin
      count <= 4'b0;
    end else begin
      if(!iSW[2])begin
        count <= count + 1;
        if(count == 4'd8) count <= 4'd0;
      end else begin
        count <= count - 1;
        if(count == 4'd0) count <= 4'd8;
      end
      case (count)
        4'd0: oNum <= 4'd8;
        4'd1: oNum <= 4'd1;
        4'd2: oNum <= 4'd0;
        4'd3: oNum <= 4'd4;
        4'd4: oNum <= 4'd4;
        4'd5: oNum <= 4'd0;
        4'd6: oNum <= 4'd0;
        4'd7: oNum <= 4'd2;
        4'd8: oNum <= 4'd3;
        default: begin
          count <= 4'b0;
          oNum <= 4'hf;
        end
      endcase
    end
  end
endmodule
