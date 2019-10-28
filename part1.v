module lab6_part1(SW, LEDR, KEY0);
    input SW, KEY0;
    output reg [8:0] LEDR;


endmodule

module fsm1(clock, resetn, w, z);
    input clock, resetn, w;
    output z;
    reg [8:0] y, Y;
    parameter [8:0] A = 9'b000000001, B = 9'b000000010, C = 9'b000000100, D = 9'b000001000, E = 9'b000010000, F = 9'b000100000, G = 9'b001000000, H = 9'b010000000, I = 9'b100000000;

    always @ (w, y)
        case (y)
            A: if (w)  Y = F;
                else   Y = B;
            B: if (w)  Y = F;
                else   Y = C;
            C: if (w)  Y = F;
                else   Y = D;
            D: if (w)  Y = F;
                else   Y = E;
            E: if (w)  Y = F;
                else   Y = E;
            F: if (w)  Y = G;
                else   Y = B;
            G: if (w)  Y = H;
                else   Y = B;
            H: if (w)  Y = I;
                else   Y = B;
            I: if (w)  Y = I;
                else   Y = B;

            default:   Y = 9'bxxxxxxxxx;

        endcase
    
    always @ (negedge resetn, posedge clock)
        if (resetn == 0)
            Y <= A;
        else
            y <= Y;

    assign z = (y == E)|(y == I);

endmodule

module fsm_resetA(clock, resetn, w, z);
    input clock, resetn, w;
    output z;
    reg [8:0] y, Y;
    parameter [8:0] A = 9'b00000000, B = 9'b000000011, C = 9'b000000101, D = 9'b000001001, E = 9'b000010001, F = 9'b000100001, G = 9'b001000001, H = 9'b010000001, I = 9'b100000001;

    always @ (w, y)
        case (y)
            A: if (w)  Y = F;
                else   Y = B;
            B: if (w)  Y = F;
                else   Y = C;
            C: if (w)  Y = F;
                else   Y = D;
            D: if (w)  Y = F;
                else   Y = E;
            E: if (w)  Y = F;
                else   Y = E;
            F: if (w)  Y = G;
                else   Y = B;
            G: if (w)  Y = H;
                else   Y = B;
            H: if (w)  Y = I;
                else   Y = B;
            I: if (w)  Y = I;
                else   Y = B;

            default:   Y = 9'bxxxxxxxxx;

        endcase
    
    always @ (negedge resetn, posedge clock)
        if (resetn == 0)
            Y <= A;
        else
            y <= Y;

    assign z = (y == E)|(y == I);

endmodule

                
