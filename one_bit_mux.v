//one_bit_mux

module one_bit_mux(
	input wire control,
	input wire [31:0]zero,
	input wire [31:0]one,
	
	output reg [31:0]result);
	
	//integer sel = control;
	
	always 
		begin
			if (control == 0) begin
				result = zero;
			end
			
			else begin
				result = one;
			end
		end
endmodule
