module my_gate (

input wire A,

input wire B,

input wire cin,

output wire y1,

output wire y2,

output wire y3,

output wire SUM,

output wire cout

);

assign y1 = A ^ B ;

assign y2 = cin & y1;

assign y3 = A & B;

assign cout = y2 | y3;

 endmodule


