module instruction_memory(
input wire [31:0] pc_address,
output wire [31:0] instruction
);
reg [31:0] info_box [63:0];
assign instruction = info_box [pc_address [7:2]];
initial begin
info_box [0] = 32'h002081B3;
info_box [1] = 32'h40208233;
info_box[2] = 32'h00208033;
info_box[3] = 32'h403102B3;
info_box[4] = 32'h00200333;
info_box[5] = 32'h00000013;
end
endmodule 