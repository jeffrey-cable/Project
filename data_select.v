//data_select

module data_select(

	input wire CLOCK,
	input wire [1:0]SEL,
	
	input wire [31:0]RAM,
	input wire [31:0]ROM,
	input wire [31:0]REG,
	
	input wire [4:0]RAM_SW,
	input wire [4:0]ROM_SW,
	input wire [4:0]REG_SW,
	
	output reg [31:0]DATA,
	output reg [31:0]MEM
	
);

	

	always @(posedge CLOCK) begin
			case (SEL) 
			0:
				begin
					DATA[31:0] = REG[31:0];
					MEM[31:0] = REG_SW;
				end
			
			1: begin
					DATA[31:0] = RAM[31:0];
					MEM[31:0] = 4 * RAM_SW;
				end
			
			2: begin
					DATA[31:0] = ROM[31:0];
					MEM[31:0] = 4 * ROM_SW;
				end
		endcase
	end	
		
endmodule
