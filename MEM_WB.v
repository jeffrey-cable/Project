//MEM_WB.v

module MEM_WB(
	input wire CLOCK,
	input wire [31:0]new_data_2,
	input wire [4:0]new_RD,
	
	output reg [31:0]data_2,
	output reg [4:0]RD);
	
	reg [36:0]MEM_WB;
	
	always @(posedge CLOCK) begin
		MEM_WB[4:0] <= new_RD;
		MEM_WB[36:5] <= new_data_2;
	end
	
	always begin
		data_2 = MEM_WB[36:5];
		RD = MEM_WB[4:0];
	end
endmodule