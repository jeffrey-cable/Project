//ID_EX.v

module ID_EX(
	input wire CLOCK,
	input wire [31:0]new_data_1,
	input wire [31:0]new_data_2,
	input wire [4:0]new_RD,
	
	output reg [31:0]data_1,
	output reg [31:0]data_2,
	output reg [4:0]RD);
	
	reg [68:0]ID_EX;
	
	always @(posedge CLOCK) begin
		ID_EX[4:0] <= new_RD;
		ID_EX[36:5] <= new_data_2;
		ID_EX[68:37] <= new_data_1;
	end
	
	always begin
		data_1 = ID_EX[68:37];
		data_2 = ID_EX[36:5];
		RD = ID_EX[4:0];
	end
endmodule
