//controller.v

module controller(
	input wire CLOCK,
	input wire [31:0]instruction,
	input wire zero,
	
	
	output reg [31:0]Control,
	output reg [4:0]ALU);
	
	reg [5:0]f_code;
	reg [5:0]op_code;
	
	always @(CLOCK) begin
		op_code <= instruction[31:26];
		f_code <= instruction[5:0];
//		shamt <= instruction[10:6];	// need to send this with ALUsrc (sll,srl,sra)
		end
	
	always
		begin
			if (op_code != 0)
				begin				
					case (op_code) 
					6'b001100:	// andi
						begin
							//place holder
						end
					
					6'b001101:	// ori
						begin
							//place holder
						end
					6'b001010:	// slti
						begin
							//place holder
						end
					6'b001000:	// addi
						begin
							//place holder
						end
					6'b001001:	//	addiu
						begin
							//place holder
						end
					6'b000100:	// beq
						begin
							//place holder
						end
					6'b000101:	// bne
						begin
							//place holder
						end
					6'b000001:	// bgez
						begin
							//place holder
						end
					6'b000111:	// bgtz
						begin
							//place holder
						end
					6'b100011:	// lw
						begin
							//place holder
						end
					6'b101011:	//	sw
						begin
							//place holder
						end
					6'b001111:	// lui
						begin
							//place holder
						end
					6'b000010:	// j
						begin
							//place holder
						end
					6'b000011:	// jal
						begin
							//place holder
						end
					
				endcase
			end
			
		else
			begin
					case (f_code)
					6'b100000:	// add
						begin
							Control[0] <= 1'b0;		// dest rerg
							Control[1] <= 1;		// reg w
							Control[2] <= 1'b0;		// mem w
							Control[3] <= 1'b1;		// wb mux
							Control[5:4] <= 2'b0;		// alu mux 1
							Control[7:6] <= 2'b0;		// alu mux 2
							
							ALU[4:0] <= 5'b00000;		// alu control signal
						end
					6'b100001:	// addu
						begin
							//place holder
							ALU[4:0] <= 5'b00001;		// alu control signal
						end
					6'b100010:	// sub
						begin
							//place holder
							ALU[4:0] <= 5'b00010;		// alu control signal
						end
					6'b100011:	// subu
						begin
							//place holder
							ALU[4:0] <= 5'b00011;		// alu control signal
						end
					6'b100100:	// and
						begin
							//place holder
							ALU[4:0] <= 5'b00100;		// alu control signal
						end
					6'b100101:	// or
						begin
							//place holder
							ALU[4:0] <= 5'b00101;		// alu control signal
						end
					6'b100111:	// nor
						begin
							//place holder
							ALU[4:0] <= 5'b00110;		// alu control signal
						end
					6'b101010:	// slt
						begin
							//place holder
							ALU[4:0] <= 5'b00111;		// alu control signal
						end
					6'b000000:	// sll & no_op
						begin
							Control[0] <= 1'b0;		// dest rerg
							Control[1] <= 1'b0;		// reg w
							Control[2] <= 1'b0;		// mem w
							Control[3] <= 1'b0;		// wb mux
							Control[5:4] <= 2'b0;		// alu mux 1
							Control[7:6] <= 2'b0;		// alu mux 2
							
							ALU[4:0] <= 5'b01000;		// alu control signal
						end
					6'b000010:	// srl
						begin
							//place holder
							ALU[4:0] <= 5'b01001;		// alu control signal
						end
					6'b000011:	// sra
						begin
							//place holder
							ALU[4:0] <= 5'b01010;		// alu control signal
						end
					6'b001000:	// jr
						begin
							//place holder
							ALU[4:0] <= 5'b01011;		// alu control signal
						end
					6'b011000:	// mul
						begin
							//place holder
							ALU[4:0] <= 5'b00000;		// alu control signal
						end
				endcase		
			end
	end	
	
endmodule
