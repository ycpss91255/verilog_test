module sw_hex_ctrl(
  input  [9:0] iSW,
  output [6:0] oHEX,
  output       oHEX_DP
);

//  assign {oHEX_DP, OHEX} = iSW[7:0];
  assign {oHEX_DP, oHEX} = iSW[7:0];

endmodule

