module cam(output [4:0]	out,

	   input	clk,
	   input	enable,
	   input	rst_n,
	   input	write,
	   input [4:0]	addr,
	   input [7:0]	data);

   reg [7:0] mem [0:31];
   reg [4:0] ret = 5'b11111;
   integer i;

   always @(posedge clk or negedge rst_n)
     begin

	if (~rst_n)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < 32; i = i + 1)
	       mem[i] <= 8'b0;
	  end

	else if (write)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < 32; i = i + 1)
	       if (mem[i] == data)
		 ret <= i[4:0];
	     if (!ret)
	       mem[addr] <= data;
	  end

	else if (enable)
	  begin
	     ret <= 5'b0;
	     for (i = 0; i < 32; i = i + 1)
	       if (mem[i] == data)
		 ret <= i[4:0];
	  end

     end

   assign out = ret;
endmodule
