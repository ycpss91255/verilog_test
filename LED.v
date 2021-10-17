module LED (
    input   iCLK,
    input   [2:0]   iSW,
    output reg [2:0]   oLED
  );

  always @(posedge iCLK)
  begin
    case (iSW)
      3'b001:
        oLED <= {oLED[1:0], oLED[2]};
      3'b010:
        oLED <= 3'b010;
      3'b100:
        oLED <= {oLED[0], oLED[2:1]};
      default:
        oLED <= 3'b100;
    endcase
  end
endmodule //LED
