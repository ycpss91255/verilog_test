module Decoder (
    input [2:0] A,
    input       G_n,
    output [7:0] D
  );

  assign  D[7] = (A==3'b111)?0:1;
  assign  D[6] = (A==3'b001)?0:1;
  assign  D[5] = (A==3'b111)?0:1;
  assign  D[4] = (A==3'b001)?0:1;
  assign  D[3] = (A==3'b111)?0:1;
  assign  D[2] = (A==3'b001)?0:1;
  assign  D[1] = (A==3'b111)?0:1;
  assign  D[0] = (A==3'b001)?0:1;

endmodule //Decoder
