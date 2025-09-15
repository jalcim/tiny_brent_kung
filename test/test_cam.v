module test_cam;
   reg clk, enable, rst, write;
   reg [4:0] addr;
   reg [7:0] data;

   wire [4:0] out;

   cam cam(clk, enable, rst, write, addr, data, out);

   initial
     begin
	$dumpfile("signal_test_top.vcd");
        $dumpvars;
        $monitor("time %d\t clk %b\t enable %b\t rst %b\t write %b\t addr %d\t data %d\t out %d\n",
		 $time, clk, enable, rst, write, addr, data, out);

	clk = 0;
	enable = 0;
	rst = 0;
	write = 0;
	addr = 0;
	data = 0;
	#100;

	enable <= 1;
	rst <= 1;
	write <= 1;
	addr <= 3;
	data <= 5;
	#100;

	clk <= 1;
	#100;
	clk <= 0;
	write <= 0;
	addr <= 0;
	data <= 3;
	#100;

	clk <= 1;
	#100;
	clk <= 0;
	data <= 5;
	#100;

	clk <= 1;
	#100;
	clk <= 0;
	#100;
	
     end
endmodule
