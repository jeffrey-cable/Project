//pipeline_registers.v

module pipeline_registers(
	input wire CLOCK,
	input wire [31:0]new_,
	input wire [31:0]new_ID_EX,
	input wire [31:0]new_EX_MEM,
	input wire [31:0]new_MEM_WB.
	
	output wire [31:0]IF_ID,
	output wire [31:0]ID_EX,
	output wire [31:0]EX_MEM,
	output wire [31:0]MEM_WB
)

