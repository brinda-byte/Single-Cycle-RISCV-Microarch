`timescale 1ns / 1ps
module mux   // 2:1 MUX with 2 inputs
  (
    input  logic [31:0]  a,    
     input  logic [31:0] b,
    input  logic  sel,  // 1-bit selector (log2(2) = 1)
    output logic [31:0]y           // Output of the MUX
  );

  // Data flow style using conditional operator for N = 2
  assign y = sel ? b : a;  // Conditional operation for 2 inputs

endmodule
