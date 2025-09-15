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

	$display("vga\n");
	ena <= 1;
	rst_n <= 1;
	clk <= 1;
	ui_in <= 128;

	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	clk <= 1;
	#10;

	// CAM Tests
	$display("cam\n");

	// Reset sequence for CAM
	rst_n <= 0;
	ena <= 1;
	clk <= 1;
	#10;
	clk <= 0;
	#10;
	rst_n <= 1;
	
	// Test 1: Write test values to specific locations
	$display("=== CAM: Writing test values ===");
	
	// Write 0x55 to address 0
	ui_in <= 192 + 32 + 0;  // 192 (CAM select) + 32 (write=1) + addr=0
	uio_in <= 8'h55;        // data to write
	clk <= 1; #10; clk <= 0; #10;
	
	// Write 0xAA to address 1
	ui_in <= 192 + 32 + 1;  // addr=1
	uio_in <= 8'hAA;
	clk <= 1; #10; clk <= 0; #10;
	
	// Write 0x77 to address 2
	ui_in <= 192 + 32 + 2;  // addr=2
	uio_in <= 8'h77;
	clk <= 1; #10; clk <= 0; #10;
	
	// Write 0x33 to address 15
	ui_in <= 192 + 32 + 15; // addr=15
	uio_in <= 8'h33;
	clk <= 1; #10; clk <= 0; #10;
	
	// Test 2: Search for written values
	$display("=== CAM: Searching values ===");
	
	// Search for 0x55 (should be found at address 0)
	ui_in <= 192 + 0;       // 192 (CAM select) + write=0 (search)
	uio_in <= 8'h55;        // data to search
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0x55: uo_out=%b (expected: found=1, addr=0)", uo_out);
	
	// Search for 0xAA (should be found at address 1)
	uio_in <= 8'hAA;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0xAA: uo_out=%b (expected: found=1, addr=1)", uo_out);
	
	// Search for 0x77 (should be found at address 2)
	uio_in <= 8'h77;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0x77: uo_out=%b (expected: found=1, addr=2)", uo_out);
	
	// Search for 0x33 (should be found at address 15)
	uio_in <= 8'h33;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0x33: uo_out=%b (expected: found=1, addr=15)", uo_out);
	
	// Test 3: Search for non-existent value
	$display("=== CAM: Searching non-existent values ===");
	
	// Search for 0xFF (should not be found)
	uio_in <= 8'hFF;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0xFF: uo_out=%b (expected: found=0)", uo_out);
	
	// Search for 0x00 (should not be found)
	uio_in <= 8'h00;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search 0x00: uo_out=%b (expected: found=0)", uo_out);
	
	// Test 4: Overwrite existing value
	$display("=== CAM: Overwriting values ===");
	
	// Overwrite address 1 with 0xCC
	ui_in <= 192 + 32 + 1;  // write to addr=1
	uio_in <= 8'hCC;
	clk <= 1; #10; clk <= 0; #10;
	
	// Search for old value 0xAA (should not be found)
	ui_in <= 192 + 0;       // search mode
	uio_in <= 8'hAA;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search old 0xAA: uo_out=%b (expected: found=0)", uo_out);
	
	// Search for new value 0xCC (should be found at address 1)
	uio_in <= 8'hCC;
	clk <= 1; #10; clk <= 0; #10;
	$display("Search new 0xCC: uo_out=%b (expected: found=1, addr=1)", uo_out);
	
	// Test 5: Reset functionality
	$display("=== CAM: Testing reset ===");
	rst_n <= 0;
	clk <= 1; #10; clk <= 0; #10;
	rst_n <= 1;
	
	// After reset, search should not find previous values
	ui_in <= 192 + 0;       // search mode
	uio_in <= 8'hCC;
	clk <= 1; #10; clk <= 0; #10;
	$display("After reset, search 0xCC: uo_out=%b (expected: found=0)", uo_out);
	
	#100;
	
     end
endmodule // test_top
