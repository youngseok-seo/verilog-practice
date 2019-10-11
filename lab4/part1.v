module part1(SW, HEX1, HEX0);

    input [7:0] SW;
    output [6:0] HEX1, HEX0;

    disp_4bit7seg U0 (SW[7:4], HEX1);
    disp_4bit7seg U1 (SW[3:0], HEX0);

endmodule // Display two values set by SW[7:4] and SW[3:0] to HEX1 and HEX0, respectively.


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
