//top.v

module top(
	input wire [17:0]SW,
	input wire [3:0]KEY,
	input wire CLOCK_50,
	
	output wire [6:0]HEX0,
	output wire [6:0]HEX1,
	output wire [6:0]HEX2,
	output wire [6:0]HEX3,
	output wire [6:0]HEX4,
	output wire [6:0]HEX5,
	output wire [6:0]HEX6,
	output wire [6:0]HEX7,
	
	output wire LCD_ON,
	output wire LCD_BLON,
	output reg [7:0]LCD_DATA,
	output wire LCD_RW,
	output wire LCD_RS,
	output wire LCD_EN
	);
	
	integer one_hz;
	integer hundred_hz;
	integer CLOCK;
	integer NEG_CLOCK;
	
	wire [31:0]reg_debug_data;
	
	wire [31:0]RAM_DATA;		//Memory Outputs
	wire [31:0]ROM_DATA;
	
	wire [4:0]RD_SEL;			//Destination Register Selection
	
	wire [31:0]CONTROL;	//MUX Control Signals
	
	wire [4:0]ALU_CONTROL;	//ALU Control Signals
	
	
	reg [31:0]PC;				//Instruction Memory Address
	
	wire [31:0]IF_ID_OUT;	//Intruction Memory Output
	
	wire [31:0]REG_FILE_D1;	//Register File Outputs
	wire [31:0]REG_FILE_D2;
	
	wire [31:0]ID_EX_D1;		//ID_EX Register Outputs
	wire [31:0]ID_EX_D2;
	wire [4:0]ID_EX_RD;
	wire [31:0]ID_EX_ALU_Control;
	wire [31:0]ID_EX_Control;
	
	wire [31:0]EX_MEM_D1;	//EX_MEM Register Outputs
	wire [31:0]EX_MEM_D2;
	wire [4:0]EX_MEM_RD;
	wire [31:0]EX_MEM_Control;
	
	wire [31:0]MEM_WB_D2;	//MEM_WB Register Outputs
	wire [4:0]MEM_WB_RD;
	wire [31:0]MEM_WB_Control;
	
	wire [31:0]alu_out;
	
	
	initial PC = 32'h00400000 - 4;
	
	assign LCD_ON = 1'b1;
	assign LCD_BLON = 1'b1;
	
	wire [31:0] LCD_DATA_1;
	wire [31:0] LCD_DATA_2;
	
	clk_div(
		CLOCK_50,
		,
		,
		,
		,
		hundred_hz,
		,
		one_hz);
		
		always begin
			if(SW[17] == 1'b0) begin
				CLOCK = KEY[1];
				NEG_CLOCK = -1 * KEY[1];
			end else begin
				CLOCK = one_hz;
				NEG_CLOCK = -1 * one_hz;
			end
		end
		
		always @(posedge CLOCK) begin
			if (KEY[0] == 1'b0) begin
				PC <= -4;
			end else begin
				PC <= (PC + 4);
			end
		end
		
	instr_memory(
		PC[4:0],
		NEG_CLOCK,
		ROM_DATA[31:0]
	);
	
	IF_ID(
		CLOCK,
		ROM_DATA,
		IF_ID_OUT
	);
	
	controller(
		IF_ID_OUT,
		,				
		CONTROL,		
		ALU_CONTROL	
	);
	
	one_bit_mux(				// Destination Register Selection
		CLOCK,
		IF_ID_OUT[15:11],
		IF_ID_OUT[20:16],
		RD_SEL
	);
	
	
	reg_file(
		CLOCK,			//clock
		KEY[0], 			//reset 
		1'b1, 					//write enable
		, 					//clock_debug
		IF_ID_OUT[25:21], 					//read_address_1
		IF_ID_OUT[20:16], 					//read_address_2
		MEM_WB_RD, 					//write_address
		SW[4:0],  		//read_address_debug
		MEM_WB_D2,					//write_data_in
		REG_FILE_D1, 					//data_out_1
		REG_FILE_D2,					//data_out_2
		reg_debug_data //data_out_debug 
	);
		
	ID_EX(
		CLOCK,
		REG_FILE_D1,
		REG_FILE_D2,
		RD_SEL,
		CONTROL,
		ALU_CONTROL,
		ID_EX_D1,
		ID_EX_D2,
		ID_EX_RD,
		ID_EX_Control,
		ID_EX_ALU_Control
	);
	
	alu(
		ID_EX_D1,
		ID_EX_D2,
		alu_out
	);
	
	EX_MEM(
		CLOCK,
		ID_EX_D1,	//not sure whats meant to go here
		alu_out,
		ID_EX_RD,
		ID_EX_Control,
		EX_MEM_D1,
		EX_MEM_D2,
		EX_MEM_RD,
		EX_MEM_Control
	);
	
	data_memory(
		EX_MEM_D2,
		NEG_CLOCK,
		EX_MEM_D1,//data
		1'b0,//write enable
		RAM_DATA[31:0]
	);

	MEM_WB(
		CLOCK,
		EX_MEM_D2,
		EX_MEM_RD,
		EX_MEM_Control,
		MEM_WB_D2,
		MEM_WB_RD,
		MEM_WB_Control
	);

	CLK_CNT(
		CLOCK,			//clock
		KEY[0],			//reset
		HEX0[6:0],		//hex digit 0
		HEX1[6:0],		//hex digit 1
		HEX2[6:0],		//hex digit 2
		HEX3[6:0]		//hex digit 3
	);
		
		
	data_select(
		CLOCK,
		SW[16:15],
		RAM_DATA[31:0],//ram data
		ROM_DATA[31:0],//rom data
		reg_debug_data,
		SW[9:5],
		SW[14:10],
		SW[4:0],
		LCD_DATA_1,
		LCD_DATA_2
	);
		

	LCD_Display(
		1'b1,
		CLOCK_50,
		LCD_DATA_1,
		LCD_DATA_2,
		LCD_RS,
		LCD_EN,
		LCD_RW,
		LCD_DATA[7:0]
	);
		
	hexdigit(PC[3:0], HEX4[6:0]);
	hexdigit(PC[7:4], HEX5[6:0]);
		
	hexdigit(LCD_DATA_2[3:0], HEX6[6:0]);
	hexdigit(LCD_DATA_2[7:4], HEX7[6:0]);
		
	endmodule
	