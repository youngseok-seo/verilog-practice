module part3(SW, LEDR);
    input [8:0] SW;
    output [4:0] LEDR;

    rc_4bit_adder B0(SW[7:4], SW[3:0], SW[8], LEDR[4], LEDR[3:0]);

endmodule


module rc_4bit_adder(A, B, ci, co, S);
    input [3:0] A, B;
    input ci;
    output co;
    output [3:0] S;

    wire [2:0] W;

    full_adder A0(A[0], B[0], ci, W[0], S[0]);
    full_adder A1(A[1], B[1], W[0], W[1], S[1]);
    full_adder A2(A[2], B[2], W[1], W[2], S[2]);
    full_adder A3(A[3], B[3], W[2], co, S[3]);

endmodule // Add 4 full adders to create a 4 bit ripple carry adder.

module full_adder(a, b, ci, co, s);
    input a, b, ci;
    output co, s;

    assign s = (a~|b) ~| ci;
    
    mux_2to1 U0((a~|b), b, ci, co);

endmodule // Add 2 bits and a carry in.

module mux_2to1(s, u, v, m);
    input s, u, v;
    output m;
    
    assign m = (~s&u) | (s$v);

endmodule // 2 to 1 multiplexer.