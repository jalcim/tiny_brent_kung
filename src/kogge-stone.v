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
   output [7:0] P, G;
   input [7:0]	A, B;

   grey grey_0(P[0], G[0], A[0], B[0]);
   grey grey_1(P[1], G[1], A[1], B[1]);
   grey grey_2(P[2], G[2], A[2], B[2]);
   grey grey_3(P[3], G[3], A[3], B[3]);
   grey grey_4(P[4], G[4], A[4], B[4]);
   grey grey_5(P[5], G[5], A[5], B[5]);
   grey grey_6(P[6], G[6], A[6], B[6]);
   grey grey_7(P[7], G[7], A[7], B[7]);

endmodule

module kogge_stone(out, A, B, Cin);
   output [8:0] out;
   input	Cin;
   input [7:0]	A, B;

   wire [7:0]	C;

   //stage 0
   wire [7:0]	stg0_P, stg0_G;
   stage_0 stage_0_0(stg0_P, stg0_G, B, A);
   assign C[0] = Cin;

   //stage 1
   wire [7:0]	stg1_P, stg1_G;
   green green_0(C[1], stg0_P[0], stg0_G[0], C[0]);
   assign stg1_P[0] = C[1];
   black black_0(stg1_P[1], stg1_G[1], stg0_P[1], stg0_P[0], stg0_G[1], stg0_G[0]);//1
   black black_1(stg1_P[2], stg1_G[2], stg0_P[2], stg0_P[1], stg0_G[2], stg0_G[1]);//2
   black black_2(stg1_P[3], stg1_G[3], stg0_P[3], stg0_P[2], stg0_G[3], stg0_G[2]);//3
   black black_3(stg1_P[4], stg1_G[4], stg0_P[4], stg0_P[3], stg0_G[4], stg0_G[3]);//4
   black black_4(stg1_P[5], stg1_G[5], stg0_P[5], stg0_P[4], stg0_G[5], stg0_G[4]);//5
   black black_5(stg1_P[6], stg1_G[6], stg0_P[6], stg0_P[5], stg0_G[6], stg0_G[5]);//6
   black black_6(stg1_P[7], stg1_G[7], stg0_P[7], stg0_P[6], stg0_G[7], stg0_G[6]);//7

endmodule
