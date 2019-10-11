module lab5_part3(KEY, SW, HEX3, HEX2, HEX1, HEX0);
    input KEY;
    input [1:0] SW;
    output [6:0] HEX3, HEX2, HEX1, HEX0;
    
    wire [15:0] Q, Qb;

    counter_16bit A0(SW[1], KEY, SW[0], Q, Qb);

    disp_4bit7seg B0(Q[3:0], HEX0);
    disp_4bit7seg B1(Q[7:4], HEX1);
    disp_4bit7seg B2(Q[11:8], HEX2);
    disp_4bit7seg B3(Q[15:12], HEX3);

endmodule


module counter_16bit(enable, clock, clear, Q, Qb);
    input enable, clock, clear;
    output [15:0] Q, Qb;

    wire [14:0] T;

    T_ff U0(enable, clock, clear, Q[0], Qb[0]);
    assign T[0] = enable&Q[0];
    T_ff U1(T[0], clock, clear, Q[1], Qb[1]);
    assign T[1] = T[0]&Q[1];
    T_ff U2(T[1], clock, clear, Q[2], Qb[2]);
    assign T[2] = T[1]&Q[2];
    T_ff U3(T[2], clock, clear, Q[3], Qb[3]);
    assign T[3] = T[2]&Q[3];
    T_ff U4(T[3], clock, clear, Q[4], Qb[4]);
    assign T[4] = T[3]&Q[4];
    T_ff U5(T[4], clock, clear, Q[5], Qb[5]);
    assign T[5] = T[4]&Q[5];
    T_ff U6(T[5], clock, clear, Q[6], Qb[6]);
    assign T[6] = T[5]&Q[6];
    T_ff U7(T[6], clock, clear, Q[7], Qb[7]);
    assign T[7] = T[6]&Q[7];
    T_ff U8(T[7], clock, clear, Q[8], Qb[8]);
    assign T[8] = T[7]&Q[8];
    T_ff U9(T[8], clock, clear, Q[9], Qb[9]);
    assign T[9] = T[8]&Q[9];
    T_ff U10(T[9], clock, clear, Q[10], Qb[10]);
    assign T[10] = T[9]&Q[10];
    T_ff U11(T[10], clock, clear, Q[11], Qb[11]);
    assign T[11] = T[10]&Q[11];
    T_ff U12(T[11], clock, clear, Q[12], Qb[12]);
    assign T[12] = T[11]&Q[12];
    T_ff U13(T[12], clock, clear, Q[13], Qb[13]);
    assign T[13] = T[12]&Q[13];
    T_ff U14(T[13], clock, clear, Q[14], Qb[14]);
    assign T[14] = T[13]&Q[14];
    T_ff U15(T[14], clock, clear, Q[15], Qb[15]);


endmodule

module T_ff(enable, clock, clear, Q, Qb);
    input enable, clock, clear;
    output reg Q, Qb;

    always @ (posedge clock, negedge clear)
        begin
            if(clear == 1'b0)
                begin
                    Q <= 1'b0;
                    Qb <= 1'b1; 
                end
            else if(enable == 1'b1)
                begin
                    Q <= enable;
                    Qb <= ~enable;
                end
        end

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