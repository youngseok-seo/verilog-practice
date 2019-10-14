module counter_reg_16_bit(enable, clock, clear, Q);
    input enable, clock, clear;
    output [15:0] Q;

    counter_reg U0(enable, clock, clear, Q[0]);
    counter_reg U1(Q[0], clock, clear, Q[1]);
    counter_reg U2(Q[1], clock, clear, Q[2]);
    counter_reg U3(Q[2], clock, clear, Q[3]);
    counter_reg U4(Q[3], clock, clear, Q[4]);
    counter_reg U5(Q[4], clock, clear, Q[5]);
    counter_reg U6(Q[5], clock, clear, Q[6]);
    counter_reg U7(Q[6], clock, clear, Q[7]);
    counter_reg U8(Q[7], clock, clear, Q[8]);
    counter_reg U9(Q[8], clock, clear, Q[9]);
    counter_reg U10(Q[9], clock, clear, Q[10]);
    counter_reg U11(Q[10], clock, clear, Q[11]);
    counter_reg U12(Q[11], clock, clear, Q[12]);
    counter_reg U13(Q[12], clock, clear, Q[13]);
    counter_reg U14(Q[13], clock, clear, Q[14]);
    counter_reg U15(Q[14], clock, clear, Q[15]);

endmodule
    


module counter_reg(enable, clock, clear, Q);
    input enable, clock, clear;
    output reg Q;
    always @ (posedge clock)
        begin
            if (enable == 1'b1)
                begin
                    Q <= Q + 1;
                end
            else if(clear == 1'b0)
                begin
                    Q = 1'b0;
                end
        end
    
endmodule