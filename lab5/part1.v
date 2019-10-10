module gated_D_latch(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (D, clock)
    begin
        if (clock == 1'b1)
        begin
            Q = D
            Qb = ~D
        end
    end
endmodule


module posedge_D_ff(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (posedge clock)
    begin
        Q <= D
        Qb <= ~D
    end
endmodule

module negedge_D_ff(D, clock, Q, Qb);
    input D, clock;
    output reg Q, Qb;
    always @ (negedge clock)
    begin
        Q <= D
        Qb <= ~D
    end
endmodule