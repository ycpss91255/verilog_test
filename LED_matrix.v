module LED_matrix (
  input         iClk,
  input         iRst_n,
  input  [4:0]  iRow,
  input  [4:0]  iCol
);

  reg    [24:0] LED_status /*synthesis noprune*/;
  reg    [2:0]  count /*synthesis noprune*/;

  /*   Col
       Pin  1   2   3   4   5
    Row 1 | 0 | 0 | 0 | 0 | 0 |
    Pin 2 | 0 | 0 | 0 | 0 | 0 |
        3 | 0 | 0 | 0 | 0 | 0 |
        4 | 0 | 0 | 0 | 0 | 0 |
        5 | 0 | 0 | 0 | 0 | 0 |
    Matrix[Row][Col]
    Row = HIGH & Col = LOW => LED Bright
    ex:
      Input
        Row Pin 1 = HIGH
        Col Pin 1 = LOW
      Output
        LED Matrix[1][1] = Bright
  */

  always @(posedge iClk, negedge iRst_n)begin
    if (!iRst_n) begin
      LED_status <= 24'b0;
    end else begin
      LED_status[4:0]   <= (iRow[0]) ? ~iCol: 5'b0;
      LED_status[9:5]   <= (iRow[1]) ? ~iCol: 5'b0;
      LED_status[14:10] <= (iRow[2]) ? ~iCol: 5'b0;
      LED_status[19:15] <= (iRow[3]) ? ~iCol: 5'b0;
      LED_status[24:20] <= (iRow[4]) ? ~iCol: 5'b0;
    end
  end

endmodule
