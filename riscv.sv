// Engineer: 
// 
// Create Date: 16.11.2024 00:07:17
// Design Name: 
// Module Name: riscv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module riscv(
input logic clk,     
     input logic reset,
     output logic [31:0]wb_out
    );
    
    //internal signals

      logic [31:0] pc;
      logic [31:0] main_add_a;
    logic [31:0]pc_imm;
    logic [31:0]inst;
    logic [6:0]opcode;
	logic [2:0] func3;
	logic [6:0] func7;
	logic [3:0]aluop;
	logic wr_en;
	logic [31:0] imm_new;
    logic [31:0] rs1_data ;
    logic [31:0] rs2_data;
    logic [31:0] aluresult;
	logic [31:0] data_out;
	
	assign pc = main_add_a;
    
    topmodule_IF fetch( 
     clk,     
     reset,              
     pc_imm,
     branchop,
     inst);
     
       topmodule_ID decode( 
    inst,wr_en,wb_out,
     imm_new, 
    rs1_data, 
    rs2_data, 
     func3,     
   func7,opcode    
);
   
   CONTROL control(opcode,func3,func7,alusrc,branch,wr_en,aluop,mem2reg,mem_read,mem_write);
   
   topmodule_EXE exec(
   rs1_data,        
   rs2_data,        
   imm_new,         
    alusrc,                 
  branch,                 
    aluop,           
     aluresult, branchop          
);

adder main_add (pc,imm_new ,pc_imm);

MEM mem(aluresult,mem_read,mem_write,rs2_data,data_out);

WB wb(aluresult,data_out,wb_out,mem2reg);
     
    
endmodule
