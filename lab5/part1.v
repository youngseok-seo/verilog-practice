module lab5_part1(SW, LEDR);
    input [1:0] SW;
    output [2:0] LEDR;

    gated_D_latch A0(SW[1], SW[0], LEDR[2]);
    posedge_D_ff B0(SW[1], SW[0], LEDR[1]);
    negedge_D_ff C0(SW[1], SW[0], LEDR[0]);

endmodule


module gated_D_latch(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (D, clock)
    begin
        if (clock == 1'b1)
        begin
            Q = D;
            Qb = ~D;
        end
    end
endmodule


module posedge_D_ff(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (posedge clock)
    begin
        Q <= D;
        Qb <= ~D;
    end
endmodule

module negedge_D_ff(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (negedge clock)
    begin
        Q <= D;
        Qb <= ~D;
    end
endmodule