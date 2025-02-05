module pc  #(parameter WIDTH = 32)  // Parameterized width (default 1 bit)
  (
    input  logic [WIDTH-1:0] pc_next,      // Data input
    input  logic clk,                // Clock signal
    input  logic reset,              // Synchronous reset signal
    output logic [WIDTH-1:0] pc  // Output
  );

  always_ff @(posedge clk) begin
    if (reset) begin
      pc <= '0;  // Reset Q to 0 if reset is high (but only on clock edge)
    end else begin
      pc <= pc_next;   // On rising edge of clk, Q gets the value of D
    end
  end
endmodule
