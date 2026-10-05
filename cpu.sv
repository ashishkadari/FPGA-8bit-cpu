module cpu (
    input logic clk,
    input logic reset
);

    logic [7:0] pc;
    logic [15:0] instruction;

    logic [3:0] opcode;
    logic [2:0] rd;
    logic [2:0] rs1;
    logic [2:0] rs2;
    logic [7:0] immediate;
    logic [7:0] address;
    logic [5:0] offset;

    logic reg_write;
    logic mem_read;
    logic mem_write;
    logic mem_to_reg;
    logic immediate_to_reg;
    logic [2:0] alu_operation;
    logic jump_enable;
    logic branch_enable;
    logic output_enable;

    logic [7:0] read_data_a;
    logic [7:0] read_data_b;

    logic [7:0] writeback_data;
	 logic	 [7:0] alu_result;

    program_counter pc_unit (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    instruction_memory instruction_memory_unit (
        .address(pc),
        .instruction(instruction)
    );

    instruction_decoder decoder_unit (
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .immediate(immediate),
        .address(address),
        .offset(offset)
    );

    control_unit control_unit_unit (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .immediate_to_reg(immediate_to_reg),
        .alu_operation(alu_operation),
        .jump_enable(jump_enable),
        .branch_enable(branch_enable),
        .output_enable(output_enable)
    );

	writeback_mux writeback_mux_unit ( 
    .alu_result(alu_result),
    .memory_data(8'b0),
    .immediate(immediate),
    .immediate_to_reg(immediate_to_reg),
    .mem_to_reg(mem_to_reg),
    .writeback_data(writeback_data)
);
    register_file register_file_unit (
        .clk(clk),
        .read_addr_a(rs1),
        .read_data_a(read_data_a),
        .read_addr_b(rs2),
        .read_data_b(read_data_b),
        .write_addr(rd),
        .write_data(writeback_data),
        .write_enable(reg_write)
    );

	 alu alu_unit (
		.a(read_data_a),
		.b(read_data_b),
		.operation(alu_operation),
		.result(alu_result)
		);
endmodule