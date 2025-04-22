
module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);


    wire clkwire;
    wire [3:0] anodewire;
    wire [3:0] plus;
    wire [3:0] minus;
    
    assign an = anodewire;
    // Instantiate the clock divider...
    // ... wire it up to the scanner
    // ... wire the scanner to the decoder

    // Wire up the math block into the decoder

    // Do not forget to wire up resets!!
    
//    clock_div div( 
   clock_div #(.DIVIDE_BY(DIVIDE_BY)) div(
        .clock(clk),
        .reset(btnC),
        .div_clock(clkwire)
    );
    
    seven_seg_scanner Scan(
        .div_clock(clkwire),
        .reset(btnC),
        .anode(anodewire)
    );
    
    
    math_block math(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(plus),
        .AminusB(minus)
    );
    
    
    
    seven_seg_decoder decode(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .anode(anodewire),
        .segs(seg),
        .AplusB(plus),
        .AminusB(minus)
    );
    
        
 
    

endmodule
