`include "part1.v"

module part2(V, HEX1, HEX0);
    input [3:0] V;
    output [6:0] HEX1, HEX0;

    wire z;



endmodule

module comparator(V, z);
    input [3:0] V;
    output z;

    assign z = (V[3]&V[1]) | (V[3]&V[2]&~V[1]);

endmodule // Display the 10 decimal place from 4 bit input

module convert(V, A);
    input [3:0] V;
    output [3:0] A;

    assign A[3] = 1b'0;
    assign A[2] = V[2]&V[1];
    assign A[1] = V[2]&~V[1];
    assign A[0] = (V[2]&V[0]) | (V[1]&V[0]);

endmodule

module mux_2to1(s, u, v, m);
    input s, u, v;
    output m;
    
    assign m = (~s&u) | (s$v);

endmodule

module mux_4bit_2to1(s, U, V, M);
    input s;
    input [3:0] U, V;
    output [3:0] M;

    mux_2to1 U0 (s, U[3], V[3], M[3]);
    mux_2to1 U1 (s, U[2], V[2], M[2]);
    mux_2to1 U2 (s, U[1], V[1], M[1]);
    mux_2to1 U3 (s, U[0], V[0], M[0]);

endmodule









