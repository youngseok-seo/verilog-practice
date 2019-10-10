module part5(SW, HEX5, HEX4, HEX1, HEX0);
    input [8:0] SW;
    output [6:0] HEX5, HEX4, HEX1, HEX0;

    wire [3:0] H1, H0;

    bcd_adder U0(SW[7:4], SW[3:0], SW[8], H1, H0);

    disp_4bit7seg A0(SW[7:4], HEX5);
    disp_4bit7seg A1(SW[3:0], HEX4);
    disp_4bit7seg A2(H1, HEX1);
    disp_4bit7seg A3(H0, HEX0);

endmodule


module bcd_adder(X, Y, ci, S1, S0);
    input [3:0] X, Y;
    input ci;
    output reg S1, S0;

    reg [3:0] T;

    begin
        T = X + Y + ci;
        if (T > 9)
            begin
                S0 = T - 10;
                S1 = 1;
            end
        else
            begin
                S0 = T;
                S1 = 0;
            end
    end

endmodule // Add two values and a carry in.


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