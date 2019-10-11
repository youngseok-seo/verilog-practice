module part2(SW, HEX1, HEX0);
    input [3:0] SW;
    output [6:0] HEX1, HEX0;

    bcd E0(SW, HEX1, HEX0);

endmodule


module disp_bcd(V, H1, H0);

    input [3:0] V;
    output [6:0] H1, H0;

    wire z;
    wire [3:0] A, M, Z;

    comparator A0(V, z);
    assign Z[3:1] = 3b'0;
    assign Z[0] = z;

    converter_4bit B0(V, A);

    mux_4bit_2to1 C0(z, V, A, M);

    disp_4bit7seg D0(Z, H1);
    disp_4bit7seg D1(M, H0);

endmodule // Display the 4 bit V on two 7 segment decoders.


module comparator(V, z);
    input [3:0] V;
    output z;

    assign z = (V[3]&V[1]) | (V[3]&V[2]&~V[1]);

endmodule // Display the 10 decimal place from 4 bit input.


module converter_4bit(V, A);
    input [3:0] V;
    output [3:0] A;

    assign A[3] = 1b'0;
    assign A[2] = V[2]&V[1];
    assign A[1] = V[2]&~V[1];
    assign A[0] = (V[2]&V[0]) | (V[1]&V[0]);

endmodule // Convert V into the 1 decimal place bit representation.


module mux_2to1(s, u, v, m);
    input s, u, v;
    output m;
    
    assign m = (~s&u) | (s$v);

endmodule // 2 to 1 multiplexer.


module mux_4bit_2to1(s, U, V, M);
    input s;
    input [3:0] U, V;
    output [3:0] M;

    mux_2to1 U0 (s, U[3], V[3], M[3]);
    mux_2to1 U1 (s, U[2], V[2], M[2]);
    mux_2to1 U2 (s, U[1], V[1], M[1]);
    mux_2to1 U3 (s, U[0], V[0], M[0]);

endmodule // Form a 4 bit multiplexer by adding 2 to 1 multiplexers.


module disp_4bit7seg(X, M);

    input [3:0] X;
    output [6:0] M;

    assign M[0] = (~X[3]&~X[2]&~X[1]&X[0]) | (X[2]&~X[1]&~X[0]);
    assign M[1] = (X[2]&~X[1]&X[0]) | (X[2]&X[1]&~X[0]);
    assign M[2] = ~X[3]&~X[2]&X[1]&~X[0];
    assign M[3] = (X[2]&~X[1]&~X[0]) | (~X[3]&~X[2]&~X[1]&X[0]) | (X[2]&X[1]&X[0]);
    assign M[4] = X[0] | (X[2]&~X[1]&~X[0]);
    assign M[5] = (~X[2]&X[1]) | (X[2]&X[1]&X[0]) | (~X[3]&~X[2]&~X[1]&X[0]);
    assign M[6] = (~X[3]&~X[2]&~X[1]) | (X[2]&X[1]&X[0]);

endmodule // Given a 4 bit input, display the corresponding value on a 7-segment display.






