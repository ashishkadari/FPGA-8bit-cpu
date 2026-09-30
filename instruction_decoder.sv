module instruction_decoder ( 
    input logic [15:0] instruction, 
 
    output logic [3:0] opcode, 
 
    output logic [2:0] rd, 
    output logic [2:0] rs1, 
    output logic [2:0] rs2, 
 
    output logic [7:0] immediate, 
    output logic [7:0] address,
    output logic [5:0] offset
); 
 
always_comb begin
    opcode = instruction[15:12];

    rd = 3'b000;
    rs1 = 3'b000;
    rs2 = 3'b000;
    immediate = 8'b0;
    address = 8'b0;
    offset = 6'b0;

    case(opcode) 
        4'b0000: begin
        end

        4'b0001: begin 
            rd = instruction[11:9]; 
            immediate = instruction[8:1]; 
        end

        4'b0010: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
            rs2 = instruction[5:3]; 
        end

        4'b0011: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
            rs2 = instruction[5:3]; 
        end

        4'b0100: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
            rs2 = instruction[5:3]; 
        end

        4'b0101: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
            rs2 = instruction[5:3]; 
        end

        4'b0110: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
            rs2 = instruction[5:3]; 
        end

        4'b0111: begin 
            rd = instruction[11:9]; 
            address = instruction[8:1]; 
        end

        4'b1000: begin 
            rs1 = instruction[11:9]; 
            address = instruction[8:1]; 
        end

        4'b1001: begin 
            address = instruction[11:4]; 
        end

        4'b1010: begin 
            rs1 = instruction[11:9]; 
            rs2 = instruction[8:6]; 
            offset = instruction[5:0];
        end

        4'b1011: begin  
            rs1 = instruction[11:9]; 
        end

        4'b1100: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
        end

        4'b1101: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
        end

        4'b1110: begin 
            rd = instruction[11:9]; 
            rs1 = instruction[8:6]; 
        end

        4'b1111: begin
        end

        default: begin
        end

    endcase
end

endmodule
	