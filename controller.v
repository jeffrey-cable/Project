//controller.v

module controller(
	//input wire CLOCK,
	input wire [31:0]instruction,
	input wire zero,
	
	output reg [31:0]MUX,
	output reg [4:0]ALU,
	output reg REG_W,
	output reg MEM_W,
	output reg DEST);
	
	integer f_code = instruction[31:26];
	integer op_code = instruction[5:0];
	
	
	always
		begin
			if (op_code != 0)
				begin				
					case (op_code) 
					001100:	// andi
						begin
							ALU = 0;
							MEM_W = 0;
							REG_W = 1;
							DEST = 1;
							MUX = 0;
						end
					
					001101:	// ori
						begin
							//place holder
						end
					001010:	// slti
						begin
							//place holder
						end
					001000:	// addi
						begin
							//place holder
						end
					001001:	//	addiu
						begin
							//place holder
						end
					000100:	// beq
						begin
							//place holder
						end
					000101:	// bne
						begin
							//place holder
						end
					000001:	// bgez
						begin
							//place holder
						end
					000111:	// bgtz
						begin
							//place holder
						end
					100011:	// lw
						begin
							//place holder
						end
					101011:	//	sw
						begin
							//place holder
						end
					001111:	// lui
						begin
							//place holder
						end
					000010:	// j
						begin
							//place holder
						end
					000011:	// jal
						begin
							//place holder
						end
					
				endcase
			end
			
		else
			begin
					case (f_code)
					100000:	// add
						begin
							//place holder
						end
					100001:	// addu
						begin
							//place holder
						end
					100010:	// sub
						begin
							//place holder
						end
					100011:	// subu
						begin
							//place holder
						end
					100100:	// and
						begin
							//place holder
						end
					100101:	// or
						begin
							//place holder
						end
					100111:	// nor
						begin
							//place holder
						end
					101010:	// slt
						begin
							//place holder
						end
					000000:	// sll & no_op
						begin
							//place holder
						end
					000010:	// srl
						begin
							//place holder
						end
					000011:	// sra
						begin
							//place holder
						end
					001000:	// jr
						begin
							//place holder
						end
					011000:	// mul
						begin
							//place holder
						end
				endcase		
			end
	end	
	
endmodule
