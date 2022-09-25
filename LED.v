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
      case ( iSW )
        2'b01: status <= { status[0], status[9:1] };
        2'b10: status <= { status[8:0], status[9] };
        default: status <= status;
      endcase
    end
  end

  assign oLED = status;

endmodule

