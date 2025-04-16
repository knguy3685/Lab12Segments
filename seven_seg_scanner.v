module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);


    wire[1:0] next;
    wire [1:0] State;
 
 
   state_dff first(
        .D(next[0]),
        .Default(1'b0),
        .clk(div_clock),
        .Q(State[0]),
        .reset(reset)
    );
    
    state_dff second(
        .D(next[1]),
        .Default(1'b0),
        .clk(div_clock),
        .Q(State[1]),
        .reset(reset)
    );
 
 
 

    assign anode[3] = (~State[1]&~State[0])|(~State[1]&State[0])|(State[1]&~State[0]);
    assign anode[2] = (~State[1]&~State[0])|(~State[1]&State[0]);
    assign anode[1] = (~State[1]&~State[0])|(State[1]&~State[0])|(State[1]&State[0]);
    assign anode[0] = (~State[1]&State[0])|(State[1]&~State[0])|(State[1]&State[0]);
    
    assign next[0] = (div_clock&~State[1]&~State[0])|(div_clock&State[1]&~State[0])|(~div_clock&~State[1]&State[0])|(~div_clock&State[1]&State[0]);
    assign next[1] = (div_clock&~State[1]&State[0])|(div_clock&State[1]&~State[0])|(~div_clock&State[1]&~State[0])|(~div_clock&State[1]&State[0]);
    
    
    
endmodule