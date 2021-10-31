module HEX_decoder (
    input       [3:0]   iNum,
    output      [6:0]   oNum
  );
  reg  [6:0] data;
  always @(iNum)
  begin
    case (iNum)
      4'b0000: data <= 7'b011_1111;    // 0
      4'b0001: data <= 7'b000_0110;    // 1
      4'b0010: data <= 7'b101_1011;    // 2
      4'b0011: data <= 7'b100_1111;    // 3
      4'b0100: data <= 7'b110_0110;    // 4
      4'b0101: data <= 7'b110_1101;    // 5
      4'b0110: data <= 7'b111_1101;    // 6
      4'b0111: data <= 7'b010_0111;    // 7
      4'b1000: data <= 7'b111_1111;    // 8
      4'b1001: data <= 7'b110_0111;    // 9
      default: data <= 7'b_0011_1110;    // U
    endcase
  end
  assign oNum = ~data;
endmodule //HEX_decoder
