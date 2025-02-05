`timescale 1ns / 1ps
module adder 
(
input logic [31:0]a, 
input logic [31:0]b,  
output logic [31:0]sum);

assign sum = a + b ;  // XOR gate for sum
 

endmodule
