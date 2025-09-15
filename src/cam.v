module cam(output [4:0]	out,
	   output reg	found,

	   input	clk,
	   input	enable,
	   input	rst_n,
	   input	write,
	   input [4:0]	addr,
	   input [7:0]	data);

   parameter NB_MEM = 16;
   parameter SIZE_ADDR = 4;

   reg [7:0] mem [0:NB_MEM-1];
   reg [SIZE_ADDR-1:0] ret;

   integer i;

   /* verilator lint_off UNUSEDSIGNAL */
   wire	   _ignore = addr[4];

   always @(posedge clk or negedge rst_n)
     begin

	if (~rst_n)
	  begin
	     ret <= 4'b0;
	     found <= 0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       mem[i] <= 8'b0;
	  end

	else if (write)
	  begin
	     ret <= 4'b0;
	     found <= 0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       if (mem[i] == data)
		 ret <= i[SIZE_ADDR-1:0];
	     if (!(|ret))
	       begin
		  mem[addr[SIZE_ADDR-1:0]] <= data;
	       end
	  end

	else if (enable)
	  begin
	     ret <= 4'b0;
	     found <= 0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       if (mem[i] == data)
		 begin
		    ret <= i[SIZE_ADDR-1:0];
		    found <= 1;
		 end
	  end

     end

   assign out = {1'b0, ret};
endmodule
