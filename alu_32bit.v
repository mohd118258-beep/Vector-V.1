module alu_32bit (

 input wire [31:0] A,
 
 input wire [31:0] B,

 input wire [1:0] s,

 input wire cin,

 output wire [31:0] result, 
 
 output wire cout

);
 
 wire [32:0] carry;

 assign carry [0] = s[0];

 assign cout = carry [32];

genvar i;


 generate 
 
 for (i=0 ; i < 32; i = i+1) begin : alu_loop
 alu_1bit basic_alu(
 .A(A[i]),
 .B(B[i]),
 .S(s),
 .cin(carry[i]),
 .Y(result[i]),
 .cout(carry[i+1])
);
 
end

endgenerate

endmodule

