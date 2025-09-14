module test_brent_kung;
   reg [3:0] input_A, input_B;
   reg	     Cin;
   wire [4:0] out;

   brent_kung_cin inst(out, input_A, input_B, Cin);

   initial
     begin
	$dumpfile("signal_brent_kung.vcd");
	$dumpvars;
	$display("\t\ttime,\ta,\tb, \tcin, \tout");
	$monitor("%d \t%d \t%d \t%b \t%b\n", $time, input_A, input_B, Cin, out);

	input_A <= 0;
	input_B <= 0;
	Cin <= 0;

	#100;
	input_A <= 0;
	input_B <= 0;
	Cin <= 0;

	#100;
	input_A <= 2;

	#100;
	input_B <= 1;

	#100;
	Cin <= 1;

	
     end
endmodule
