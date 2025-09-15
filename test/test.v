module test_top;
   reg  [7:0] ui_in;
   wire [7:0] uo_out;

   reg  [7:0] uio_in;
   wire [7:0] uio_out;
   wire [7:0] uio_oe;

   reg	      ena;
   reg	      clk;
   reg	      rst_n;

   tt_um_top test_top(
		      .ui_in  (ui_in),    // Dedicated inputs
		      .uo_out (uo_out),   // Dedicated outputs

		      .uio_in (uio_in),   // IOs: Input path
		      .uio_out(uio_out),  // IOs: Output path
		      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)

		      .ena    (ena),      // enable - goes high when design is selected
		      .clk    (clk),      // clock
		      .rst_n  (rst_n)     // not reset
		      );



   initial
     begin
	$dumpfile("signal_test_top.vcd");
        $dumpvars;
        $monitor("time %d\t clk %b\t ui_in %b\t uio_in %b\t uo_out %b\n", $time, clk, ui_in, uio_in, uo_out);

	//kogge-stone
	$display("kogge-stone\n");

	ui_in = 8'b0;
	uio_in = 8'b0;
	ena = 1'b0;
	clk = 1'b0;
	rst_n = 1'b0;
	#100;

	ui_in <= 2;
	uio_in <= 5;
	#100;

	uio_in <= 128 + 5;
	#100;

	//onehalt_latch
	$display("onehalf_latch\n");

	//0
	ui_in <= 64 + 0;
	uio_in <= 1;
	#100;

	//1
	clk <= 1;
	#100;

	//2
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//3
	clk <= 1;
	#100;

	//4
	clk <= 0;
	ui_in <= 64 + 1;
	uio_in <= 0;
	#100;

	//5
	clk <= 1;
	#100;

	//6
	clk <= 0;
	ui_in <= 64 + 1;
	uio_in <= 1;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 1;
	uio_in <= 1;
	#100;

	//twohalt_latch
	$display("two_half_latch\n");

	//0
	ui_in <= 64 + 0;
	uio_in <= 2;
	#100;

	//1
	clk <= 1;
	#100;

	//2
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//3
	clk <= 1;
	#100;

	//4
	clk <= 0;
	ui_in <= 64 + 2;
	uio_in <= 0;
	#100;

	//5
	clk <= 1;
	#100;

	//6
	clk <= 0;
	ui_in <= 64 + 2;
	uio_in <= 2;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 2;
	uio_in <= 2;
	#100;

	//treehalt_latch
	$display("tree_half_latch\n");

	//0
	ui_in <= 64 + 0;
	uio_in <= 4;
	#100;

	//1
	clk <= 1;
	#100;

	//2
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//3
	clk <= 1;
	#100;

	//4
	clk <= 0;
	ui_in <= 64 + 4;
	uio_in <= 0;
	#100;

	//5
	clk <= 1;
	#100;

	//6
	clk <= 0;
	ui_in <= 64 + 4;
	uio_in <= 4;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 4;
	uio_in <= 4;
	#100;

	//four halt_latch
	$display("four_half_latch\n");

	//0
	ui_in <= 64 + 0;
	uio_in <= 8;
	#100;

	//1
	clk <= 1;
	#100;

	//2
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//3
	clk <= 1;
	#100;

	//4
	clk <= 0;
	ui_in <= 64 + 8;
	uio_in <= 0;
	#100;

	//5
	clk <= 1;
	#100;

	//6
	clk <= 0;
	ui_in <= 64 + 8;
	uio_in <= 8;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 0;
	uio_in <= 0;
	#100;

	//7
	clk <= 1;
	#100;

	//8
	clk <= 0;
	ui_in <= 64 + 8;
	uio_in <= 8;
	#100;

     end

endmodule
