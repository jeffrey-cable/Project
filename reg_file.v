//reg_file
module reg_file(
	input wire CLOCK,
	input wire reset,
	input wire WriteEnable,
	input wire clock_debug,
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [4:0] write_address,
	input wire [4:0] read_address_debug,
	input wire [31:0] write_data_in,
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug,
	
	output wire [6:0]HEX6,
	output wire [6:0]HEX7);
	
	integer i;
	reg [31:0] register [31:0];
	
		initial for(i=0; i<32; i = (i + 1)) begin
			register[i] = i;
		end	

	
	always @(posedge CLOCK) begin
		if (reset == 1'b0) begin
			for(i=0; i<31; i = (i + 1)) begin
				register[i] <= i;
			end
		end 
		
		if (WriteEnable == 1'b1) begin
			register[write_address] <= write_data_in; // check logic 
		end 
		
	end
	
	always @(negedge CLOCK) begin
		data_out_1 <= register[read_address_1];
		data_out_2 <= register[read_address_2];
		data_out_debug <= register[read_address_debug];
	end
	
endmodule

