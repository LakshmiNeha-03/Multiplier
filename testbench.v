`timescale 1ns / 1ps

module testbench();
 reg [15:0] data; 
 reg clk, start; 
 wire done; 
 
 multiplier_data_path DP (eqz, lda, ldb, ldp, clrp, data, decb, clk); 
 control_path CON (lda, ldb, ldp, clrp, decb, done, clk, eqz, start); 
 
 initial 
 begin 
 clk = 1'b0; 
 #3 start = 1'b1; 
 #500 $finish; 
 end 
 
 always #5 clk = ~clk; 
 
 initial 
 begin 
 #17 data = 17; 
 #10 data = 5; 
 end 
 
 initial
 begin 
 $monitor ( " time =%d, multiplier output = %d , done = %b", $time,DP.y, done); 
 end
 
endmodule
