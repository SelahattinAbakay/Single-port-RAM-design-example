module ram(
    input clk,
    input we,/* input clk,we,rst, //saat, write enable ve resetleme pini
                output d_out // d çıkış portu*
                */
    input rst,
    input [5:0] addr,
    input [7:0] din,
    output [7:0] dout
    );
    
 reg [7:0] mem [127:0];
 reg [7:0] temp;
 integer i = 0;
 
 always@(posedge clk)
 begin   
    if(rst == 1'b1)
     begin
      for(i=0; i< 128; i = i + 1)
       begin
       mem[i] <= 200'h00;
       end
      temp <= 200'h00;
     end
     
     else
       begin
         if(we == 1'b1)
           mem[addr] <= din;
         else
           temp      <= mem[addr];     
       end   
 end   
 
 assign dout = temp;
endmodule