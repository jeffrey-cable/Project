//EX_MEM.v

module EX_MEM(
	input wire CLOCK,
	input wire [31:0]new_data_1,
	input wire [31:0]new_data_2,
	input wire [4:0]new_RD,
	
	output reg [31:0]data_1,
	output reg [31:0]data_2,
	output reg [4:0]RD);
	
	reg [68:0]EX_MEM;
	
	always @(posedge CLOCK) begin
		EX_MEM[4:0] <= new_RD;
		EX_MEM[36:5] <= new_data_2;
		EX_MEM[68:37] <= new_data_1;
	end
	
	always begin
		data_1 = EX_MEM[68:37];
		data_2 = EX_MEM[36:5];
		RD = EX_MEM[4:0];
	end
endmodule
