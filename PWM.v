module PWM (iClk, iPWM, oPWM);
  input iClk;
  input  [7:0]  iPWM;
  output  [4:0] oPWM;
  reg     [7:0] Counter;

  always @(posedge iClk) begin
    Counter <= Counter - 1;
  end

  assign oPWM = (Counter < iPWM) ? 5'b11111 : 5'b00000;

endmodule //PWM
