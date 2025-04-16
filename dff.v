module dff(
    input reset,
    input clock,
    //input D,
    output reg Q
    //output NotQ
);

    wire NotQ;
    assign NotQ = ~Q;
    
    initial begin
        Q <= 0;    
    end

    always @(posedge reset, posedge clock) begin
        if (reset) begin
            Q <= 0;
        end else if (clock) begin
            
            Q <= NotQ;
        end
    end
endmodule