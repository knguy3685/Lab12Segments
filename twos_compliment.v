module twos_compliment(

    input [3:0]A,
    output [3:0]Y

);
    wire [3:0] carry;
    wire [3:0] A_inverse;

    assign A_inverse[0] = ~A[0];
    assign A_inverse[1] = ~A[1];
    assign A_inverse[2] = ~A[2];
    assign A_inverse[3] = ~A[3];
 
    
    full_adder one(
    .A(A_inverse[0]),
    .B(1'b1),
    .Cin(1'b0),
    .Y(Y[0]),
    .Cout(carry[0])
    );
    
    full_adder two(
    .A(A_inverse[1]),
    .B(1'b0),
    .Cin(carry[0]),
    .Y(Y[1]),
    .Cout(carry[1])
    );
    
    full_adder three(
    .A(A_inverse[2]),
    .B(1'b0),
    .Cin(carry[1]),
    .Y(Y[2]),
    .Cout(carry[2])
    );
    
    full_adder four(
    .A(A_inverse[3]),
    .B(1'b0),
    .Cin(carry[2]),
    .Y(Y[3]),
    .Cout(carry[3])
    );
 
    
    
    endmodule