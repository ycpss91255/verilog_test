module LED_matrix #(
  Row,
  Col
)(
  input                       iClk,
  input                       iRst_n,
  input  [Col - 1 :0]         iRow,
  input  [Row - 1 :0]         iCol
);
  
  localparam LED_size = Row * Col - 1;
  localparam count_size = (Row % 2 != 0) ? Row / 2 : Row / 2 - 1;
  
  reg    [LED_size:0]         LED_status /*synthesis noprune*/;
  reg    [count_size:0]       count /*synthesis noprune*/;

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
      LED_status = 0;
      count = 0;
    end else begin
      if (iRow == 0) begin
        LED_status = 0;
        count = 0;
      end else begin
        for (count = 0; count < Row; count = count + 1) begin
          if (iRow[count]) LED_status = iCol << (count * Row);
        end
        count = 0;
      end
    end
  end

endmodule
