module inst_mem #(parameter WIDTH = 32)  
  ( input logic reset, 
    input logic [WIDTH-1:0]addr,
    output logic [WIDTH-1:0]inst
    );
logic [31:0] mem [0:1023];
//always_comb
//begin
//if(reset)
//inst=0;
//else
//inst= mem[addr];
//end
//endmodule

assign inst =  reset ? 32'b0 : mem [addr];
endmodule

      
 
