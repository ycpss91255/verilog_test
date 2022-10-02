module hex_num (
  input  [3:0] iSW,
  output [6:0] oHEX,
  output       oHEX_DP
);

//  Seven Segment control:
//            a 
//            __
//          f|  |b                              hgfedcba
//           |__|        segment code:  "0" ->  00111111 
//          e|g |c
//           |__| .h
//            d 

  reg [7:0] HEX_status;

  always @ ( iSW ) begin
    case( iSW )
      4'd0:    HEX_status <= 8'b0011_1111;
      4'd1:    HEX_status <= 8'b0000_0110;
      4'd2:    HEX_status <= 8'b0101_1011;
      4'd3:    HEX_status <= 8'b0100_1111;
      4'd4:    HEX_status <= 8'b0110_0110;
      4'd5:    HEX_status <= 8'b0110_1101;
      4'd6:    HEX_status <= 8'b0111_1101;
      4'd7:    HEX_status <= 8'b0010_0111;
      4'd8:    HEX_status <= 8'b0111_1111;
      4'd9:    HEX_status <= 8'b0110_0111;
      4'hA:    HEX_status <= 8'b0111_0111;
      4'hB:    HEX_status <= 8'b1111_1111;
      4'hC:    HEX_status <= 8'b0011_1001;
      4'hD:    HEX_status <= 8'b1011_1111;
      4'hE:    HEX_status <= 8'b0111_1001;
      4'hF:    HEX_status <= 8'b0111_0001;
      default: HEX_status <= 8'b1111_1001;
    endcase
  end

  assign {oHEX_DP, oHEX} = ~HEX_status;

endmodule
