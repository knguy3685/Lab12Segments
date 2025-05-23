

module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    // 100 MHz input clock, divide down by chaining N FlipFlops together
    // to slow down the clock by 1/2^N
    
    
    wire[DIVIDE_BY:0] div;
    
    assign div[0] = clock;
    
    genvar i;
    
    wire [DIVIDE_BY-1:0] wireQ;
    
    generate 
        for( i=0; i < DIVIDE_BY; i = i+1) begin
        
            dff u0 (
            .clock(div[i]), 
            .reset(reset),
            .D(wireQ[i]),
            .Q(div[i+1]),
            .Qnot(wireQ[i])
            
            );
           
        end
        
    endgenerate
    
    assign div_clock = div[DIVIDE_BY];
    
     
endmodule
