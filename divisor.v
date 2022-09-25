module divisor
  #(Threshold) 
  ( iClk, iRst_n, oClk );
  input           iClk;
  input           iRst_n;
  output reg      oClk;

  reg [31:0] count;

  always @ ( posedge iClk, negedge iRst_n ) begin
    if ( !iRst_n ) begin
      count <= 32'b0;
      oClk  <= 1'b0;
    end else begin
      if ( count <= Threshold ) begin
        count <= count + 1;
      end else begin
        count <= 32'b0;
        oClk <= ~oClk;
      end
    end
  end
endmodule