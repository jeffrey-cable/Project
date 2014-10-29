// pc_controller.v

module pc_controller(
	input wire CLOCK,
	input wire reset,
	input wire hazard,
	output reg [31:0]PC
);

	initial begin
		PC = 32'h00400000 - 4;
	end
	
		always @(posedge CLOCK) begin
			
			if (reset == 1'b0) begin
				PC <= 32'h00400000 - 4;
			end
			
			else if (hazard == 1) begin
				PC <= PC - 4;
			end else begin
				PC <= (PC + 4);
			end
		end
endmodule
