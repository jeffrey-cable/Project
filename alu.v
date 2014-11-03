//alu.v

module alu(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire [4:0] aluSrc,
	
	output reg [31:0] zero,
	output reg [31:0] jumpOut,
	output reg [31:0] result);


//	assign add_ab = a + b;
//	assign sub_ab = a - b;
	
//	assign oflow_add = (a[31] == b[31] && add_ab[31] != a[31]) ? 1 : 0;
//	assign oflow_sub = (a[31] == b[31] && sub_ab[31] != a[31]) ? 1 : 0;

	
	
	
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
			5'b00010:	// sub
				begin
					result <= a - b;
				end
			5'b00011:	// subu
				begin
					result <= a - b;
				end
			5'b00100:	// and
				begin
					result <= a & b;
				end
			5'b00101:	// or
				begin
					result <= a | b;
				end
			5'b00110:	// nor
				begin
					result <= ~(a | b);
				end
			5'b00111:	// slt
				begin
					if(a < b) begin
						result <= 32'd1;
					end else begin
						result <= 32'd0;
					end
				end
			5'b01000:	// sll
				begin
//					result <= a << shamt;;
				end
			5'b01001:	// srl
				begin
//					result <= a >> shamt;
				end
			5'b01010:	// sra
				begin
//					result <= a >> shamt;	// different than srl
				end
			5'b01011:	// jr
				begin
//					pc <= a;		// need to send to PC to change address
				end
		endcase
	end
endmodule
