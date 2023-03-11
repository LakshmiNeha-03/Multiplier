    `timescale 1ns / 1ps
    
    module multiplier_data_path(eqz,lda, ldb, ldp, clrp, data, decb, clk);
    
    input lda, ldb, ldp, clrp, decb, clk;
    input [15:0] data;
    output eqz;
    wire [15:0] x, y, z, bout, bus;
    
    assign bus = data;
    pipo1 A (x, lda, bus, clk);
    pipo2 P (y, ldp, z, clk, clrp);   
    counter C (bout, ldb, bus, decb, clk );
    adder add(z,x,y);
    comp d (eqz,bout);
    
    endmodule
    
    module pipo1 (x,lda, data, clk);
     input lda, clk;
     input [15:0] data;
     output reg [15:0] x;
     
    always@(posedge clk) begin
    if(lda)
    x<= data;
    end
    endmodule
    
    module pipo2 (y,ldp, data, clk, clrp);
    output  reg [15:0] y;
    input ldp,clk, clrp;
    input [15:0] data;
    
    always@(posedge clk) begin
    if(clrp)
    y<=16'b0;
    else if(ldp)
    y<= data;
    end
    endmodule
    
    module counter( b,ldb, data,decb, clk);
    output reg [15:0] b;
    input [15:0] data;
    input ldb,decb,clk;
    
    always@(posedge clk) begin
    if(ldb) b <= data;
    else if(decb) b<= b-1;
    end
    endmodule
    
    module adder(output reg [15:0]  z, input[15:0] x, y);
    always@(*)begin
    z = x+y;
    end
    endmodule
    
    module comp (output reg eqz, input [15:0] x);
    always@(*) begin
    if(!x) eqz = 1;
    else
    eqz = 0;
    end
    endmodule
    
    module control_path (lda, ldb, ldp, clrp, decb, done, clk, eqz, start);
    input eqz, start, clk;
    output reg lda, ldb, ldp, clrp, decb, done;
    reg [2:0] state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
    
    always@(posedge clk) begin
    case(state) 
    S0 : if(start) state<= S1;
    S1 : state <= S2;
    S2 : state <= S3;
    S3 : #3 if(eqz) state <= S4;
    S4 : state <= S4;
    default : state<= S0;     
    endcase
    end
    
    always@(state)
    begin
    case(state)
    S0 : begin lda=0; ldb=0; ldp=0; clrp=0; decb=0; done = 0;  end
    S1 : begin lda =1;  end
    S2 : begin ldb=1; lda=0; clrp=1; end
    S3 : begin ldb =0; ldp=1; clrp=0; decb=1; end
    S4 : begin done=1; ldp=0; decb=0;end
    default: begin lda=0; ldb=0; ldp=0; clrp=0; decb=0; done=0; end
    endcase
    end
    endmodule
