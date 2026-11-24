module mux2to1 (

input wire A,

input wire x0,

input wire x1,

output wire X

);

 wire y1;

 wire y2;

 wire y3;

assign y1 = ~A ;

assign y2 = A & x1;

assign y3 = y1 & x0;

assign X = y2 | y3;

 endmodule 