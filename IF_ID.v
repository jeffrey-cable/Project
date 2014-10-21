//IF_ID.v

module IF_ID(
	input wire CLOCK,
	input wire [31:0]new_INSTR,
	output reg [31:0]INSTR);
	
	reg [31:0]IF_ID;
	always @(posedge CLOCK) begin
		IF_ID <= new_INSTR;
	end
	
	always begin
		INSTR = IF_ID;
	end
endmodule

		
