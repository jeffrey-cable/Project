// hazard_detection_unit.v

module hazard_detection_unit(
	input wire CLOCK,
	input wire [31:0]instruction,
	
	output reg Control,
	output reg PC);
	
	//initial begin
		reg [31:0]inst_1 = 0;
		reg [31:0]inst_2 = 0;
		reg [31:0]inst_3 = 0;
	//end

	always @(posedge CLOCK) begin
		inst_3 = inst_2;
		inst_2 = inst_1;
		inst_1 = instruction;
		
		if (instruction == 0) begin
				Control = 1;
				PC = 0;
		end	
		
		else if ((inst_1[25:21] == inst_2[15:11]) || (inst_1[20:16] == inst_2[15:11]))
			begin
				Control = 0;
				PC = 1;
			end
		else if ((inst_1[25:21] == inst_3[15:11]) || (inst_1[20:16] == inst_3[15:11]))
			begin
				Control = 0;
				PC = 1;
			end
		else begin
			Control = 1;
			PC = 0;
		end
	end
endmodule

		
				
	