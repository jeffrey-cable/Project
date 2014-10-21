//CLK_CNT

module CLK_CNT(
	input wire CLOCK,
	input wire reset,
	output wire [6:0]HEX0,
	output wire [6:0]HEX1,
	output wire [6:0]HEX2,
	output wire [6:0]HEX3);
	
	reg [15:0] counter;
	
	initial begin
	counter[15:0] <= 16'b0;
	end
	
	always @(posedge CLOCK) begin
		if (reset == 1'b0) begin
			counter <= 0;
		end else begin
			counter <= (counter + 1);
		end
	end
		
	hexdigit(counter[3:0], HEX0);
	hexdigit(counter[7:4], HEX1);
	hexdigit(counter[11:8], HEX2);
	hexdigit(counter[15:12], HEX3);
	
endmodule
		
		