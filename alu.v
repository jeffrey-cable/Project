//alu.v

module alu(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire [4:0] aluSrc,
	
	output reg [31:0] zero,
	output reg [31:0] result);

	always @(*) begin
		case(aluSrc)
			5'b00000:	// add
				begin
					result <= a + b;
				end
			5'b00001:	// addu
				begin
					result <= a + b;
				end
			5'b00001:	// sub
				begin
					result <= a - b;
				end
			5'b00001:	// subu
				begin
					result <= a - b;
				end
			5'b00001:	// and
				begin
					result <= a & b;
				end
			5'b00001:	// or
				begin
					result <= a | b;
				end
			5'b00001:	// nor
				begin
					result <= ~(a | b);
				end
			5'b00001:	// slt
				begin
					if(a < b) begin
						result <= 1;
					end else begin
						result <= 0
					end
				end
			5'b00001:	// sll
				begin
//					result <= a << shamt;;
				end
			5'b00001:	// srl
				begin
//					result <= a >> shamt;
				end
			5'b00001:	// sra
				begin
//					result <= a >> shamt;
				end
			5'b00001:	// jr
				begin
//					pc <= a;
				end
			5'b00001:	// nop
				begin
					result <= 8'h0;
				end
		endcase
	end
endmodule
