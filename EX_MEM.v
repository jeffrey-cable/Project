//EX_MEM.v

module EX_MEM(
	input wire CLOCK,
	input wire [31:0]new_data_1,
	input wire [31:0]new_data_2,
	input wire [4:0]new_RD,
	input wire [31:0]new_Control,
	
	output reg [31:0]data_1,
	output reg [31:0]data_2,
	output reg [4:0]RD,
	output reg [31:0]Control);

	
	always @(posedge CLOCK) begin
		RD <= new_RD;
		data_2 <= new_data_2;
		data_1 <= new_data_1;
		Control <= new_Control;
	end
endmodule
