module LED (iClk, iRst_n, iSW, oLED);
  input        iClk;
  input        iRst_n;
  input  [1:0] iSW;
  output [9:0] oLED;

  reg        [9:0] status = 10'b1;

  always @ ( posedge iClk, negedge iRst_n ) begin
    if ( !iRst_n ) begin
      status <= 10'b1;
    end else begin
      if ( iSW[1]) begin
        // rotate right
        status <= { status[0], status[9:1] };
      end else
      if ( iSW[0] ) begin
        // rotate lift
        status <= { status[8:0], status[9] };
      end else  begin
        status <= status;
      end
    end
  end

  assign oLED = status;

endmodule

