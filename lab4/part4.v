module part4(SW, LEDR, HEX5, HEX4, HEX1, HEX0);
    input [8:0] SW;
    output [4:0] LEDR;
    output [6:0] HEX5, HEX4, HEX1, HEX0;

    disp_rc_bcd_adder J0(SW[7:4], SW[3:0], SW[8], HEX1, HEX0, LEDR[4:0]);

    disp_4bit7seg K0(SW[7:4], HEX5);
    disp_4bit7seg K1(SW[3:0], HEX4);

endmodule

module disp_rc_bcd_adder(X, Y, ci, S1, S0, SUM);
    input [3:0] X, Y;
    input ci;
    output [6:0] S1, S0;
    output [4:0] SUM;

    wire z;
    wire [3:0] CONV4, Z, MUX1, CONV5, MUX2;

    rc_4bit_adder B0(X, Y, ci, SUM[4], SUM[3:0]);

    comparator C0(SUM[3:0], z);
    assign Z[3:1] = 3b'000;
    assign Z[0] = z | SUM[4];

    converter_4bit D0(SUM[3:0], CONV4);

    mux_4bit_2to1 E0(z, SUM[3:0], CONV4, MUX1);

    converter_5bit F0(SUM[3:0], CONV5);

    mux_4bit_2to1 G0(SUM[4], MUX1, CONV5, MUX2);

    disp_4bit7seg H0(Z, S1);
    disp_4bit7seg H1(MUX2, S0);

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


module mux_4bit_2to1(s, U, V, M);
    input s;
    input [3:0] U, V;
    output [3:0] M;

    mux_2to1 U0 (s, U[3], V[3], M[3]);
    mux_2to1 U1 (s, U[2], V[2], M[2]);
    mux_2to1 U2 (s, U[1], V[1], M[1]);
    mux_2to1 U3 (s, U[0], V[0], M[0]);

endmodule // Form a 4 bit multiplexer by adding 2 to 1 multiplexers.


module mux_2to1(s, u, v, m);
    input s, u, v;
    output m;
    
    assign m = (~s&u) | (s$v);

endmodule // 2 to 1 multiplexer.


module converter_5bit(V, B);
    input [3:0] V;
    output [3:0] B;

    assign B[3] = V[2] | V[1];
    assign B[2] = ~V[2]&~V[1];
    assign B[1] = ~V[1];
    assign B[0] = V[0];

endmodule


module disp_4bit7seg(X, M);

    input [3:0] X;
    output [6:0] M;

    assign M[0] = (~X[3]&~X[2]&~X[1]&X[0]) | (X[2]&~X[1]&~X[0]);
    assign M[1] = (X[2]&~X[1]&X[0]) | (X[2]&X[1]&~X[0]);
    assign M[2] = ~X[3]&~X[2]&X[1]&~X[0];
    assign M[3] = (X[2]&~X[1]&~X[0]) | (~X[3]&~X[2]&~X[1]&X[0]) | (X[2]&X[1]&X[0]);
    assign M[4] = X[0] | (X[2]&~X[1]&~X[0]);
    assign M[5] = (~X[2]&X[1]) | (X[2]&X[1]&X[0]) | (~X[3]&~X[2]&~X[1]&X[0]);
    assign M[6] = (~x[3]&~X[2]&~X[1]) | (X[2]&X[1]&X[0]);

endmodule // Given a 4 bit input, display the corresponding value on a 7-segment display.
