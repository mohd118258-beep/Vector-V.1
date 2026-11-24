module control_unit(
input wire [6:0] opcode,
input wire funct7_bit,
output reg reg_wire,
output reg alu_sc,
output reg [1:0] alu_ctrl
);
always @(*) begin
case(opcode)
7'b0110011: begin
reg_wire = 1'b1;
alu_sc = 1'b0;
if (funct7_bit==1'b0)
alu_ctrl =2'b0;
else alu_ctrl=2'b1;
end
7'b0010011: begin
reg_wire=1'b1;
alu_sc = 1'b1;
alu_ctrl= 2'b00;
end 
default: begin
reg_wire=1'b0;
alu_sc = 1'b0;
alu_ctrl= 2'b00;
end
endcase 
end
endmodule 