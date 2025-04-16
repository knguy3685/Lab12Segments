module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

    wire [3:0] add;
    wire [3:0] sub;
    wire [3:0] carrysub;
    wire [3:0] Bcomp ;
    wire [3:0] carryadd;
    
    full_adder add_zero(
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),
        .Y(add[0]),
        .Cout(carryadd[0])
    );
    
    full_adder add_one(
        .A(A[1]),
        .B(B[1]),
        .Cin(carryadd[0]),
        .Y(add[1]),
        .Cout(carryadd[1])
    );
    
    full_adder add_two(
        .A(A[2]),
        .B(B[2]),
        .Cin(carryadd[1]),
        .Y(add[2]),
        .Cout(carryadd[2])
    );
    
    full_adder add_three(
        .A(A[3]),
        .B(B[3]),
        .Cin(carryadd[2]),
        .Y(add[3]),
        .Cout(carryadd[3])
    );
    
    twos_compliment compli(
        .A(B),
        .Y(Bcomp)
    );
    
    full_adder sub1(
        .A(A[0]),
        .B(Bcomp[0]),
        .Cin(1'b0),
        .Cout(carrysub[0]),
        .Y(sub[0])
     );
     
     full_adder sub2(
        .A(A[1]),
        .B(Bcomp[1]),
        .Cin(carrysub[0]),
        .Cout(carrysub[1]),
        .Y(sub[1])
     );
     
     full_adder sub3(
        .A(A[2]),
        .B(Bcomp[2]),
        .Cin(carrysub[1]),
        .Cout(carrysub[2]),
        .Y(sub[2])
     );
     
     full_adder sub4(
        .A(A[3]),
        .B(Bcomp[3]),
        .Cin(carrysub[2]),
        .Cout(carrysub[3]),
        .Y(sub[3])
     );
     
     assign AplusB = add;
     assign AminusB = sub;
        
        
        
endmodule