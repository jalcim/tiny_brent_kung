module cam(output [4:0]	out,
//	   output	found,

	   input	clk,
	   input	enable,
	   input	rst_n,
	   input	write,
	   input [4:0]	addr,
	   input [7:0]	data);

   parameter NB_MEM = 16;

   reg [7:0] mem [0:NB_MEM-1];
   reg [4:0] ret;
//   reg	     found;

   integer i;

   always @(posedge clk or negedge rst_n)
     begin

	if (~rst_n)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       mem[i] <= 8'b0;
	  end

	else if (write)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       if (mem[i] == data)
		 ret <= i[4:0];
	     if (!(|ret))
	       mem[addr] <= data;
	  end

	else if (enable)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < NB_MEM; i = i + 1)
	       if (mem[i] == data)
		 ret <= i[4:0];
	  end

     end

   assign out = ret;
endmodule
