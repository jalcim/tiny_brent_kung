module black(P, G, Pi, Pj, Gi, Gj);
   output P,  G;
   input  Pi, Pj, Gi, Gj;

   assign P = Pi & Pj;
   assign G = Gi | (Pi & Gj);

endmodule

module grey(P, G, A, B);
   output P,  G;
   input  A, B;

   assign P = A ^ B;
   assign G = A & B;

endmodule

module green(C_out, Pi, Gi, C_in);
  output C_out;
  input Pi, Gi, C_in;

  assign C_out = Gi | (Pi & C_in);

endmodule

module stage_0(P, G, A, B);
   output [3:0] P, G;
   input [3:0]	A, B;

   grey grey_0(P[0], G[0], A[0], B[0]);
   grey grey_1(P[1], G[1], A[1], B[1]);
   grey grey_2(P[2], G[2], A[2], B[2]);
   grey grey_3(P[3], G[3], A[3], B[3]);

endmodule

module brent_kung_cin (out, A, B, Cin);
   output [4:0] out;
   input	Cin;
   input [3:0]	A, B;

   wire [2:0]	black_P, black_G;
   wire [3:0]	RED_P, RED_G;
   wire [4:0]	C;

   wire	[3:0]	GREY_P, GREY_G;
   stage_0 stage_0_0(GREY_P, GREY_G, B, A);
   assign C[0] = Cin;

   assign out[0] = GREY_P[0] ^ C[0];

   //stage 1
   green green_1(C[1], GREY_P[0], GREY_G[0], C[0]);//0
   assign out[1] = GREY_P[1] ^ C[1];

//   wire [3:0] stage_1_P, stage_1_G;
   black black_0(black_P[0], black_G[0], GREY_P[1], GREY_P[0], GREY_G[1], GREY_G[0]);//1
   black black_1(black_P[1], black_G[1], GREY_P[3], GREY_P[2], GREY_G[3], GREY_G[2]);//3

   //stage 2
   green green_2(C[2], black_P[0], black_G[0], C[0]);//1
   assign out[2] = GREY_P[2] ^ C[2];

//   wire [3:0] stage_2_P, stage_2_G;
   black black_4(black_P[2], black_G[2], black_P[1], black_P[0], black_G[1], black_G[0]);//3

   //stage 3
   green green_3(C[3], GREY_P[2], GREY_G[2], C[2]);//2
   assign out[3] = GREY_P[3] ^ C[3];
   green green_4(C[4], black_P[2], black_G[2], C[0]);//3
   assign out[4] = C[4];

endmodule
