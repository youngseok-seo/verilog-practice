module counter_reg_16_bit(enable, clock, clear, Q);
    input enable, clock, clear;
    output [15:0] Q;

    counter_reg U0(enable, clock, clear, Q[0]);
    counter_reg U1(enable, clock, clear, Q[1]);
    counter_reg U2(enable, clock, clear, Q[2]);
    counter_reg U3(enable, clock, clear, Q[3]);
    counter_reg U4(enable, clock, clear, Q[4]);
    counter_reg U5(enable, clock, clear, Q[5]);
    counter_reg U6(enable, clock, clear, Q[6]);
    counter_reg U7(enable, clock, clear, Q[7]);
    counter_reg U8(enable, clock, clear, Q[8]);
    counter_reg U9(enable, clock, clear, Q[9]);
    counter_reg U10(enable, clock, clear, Q[10]);
    counter_reg U11(enable, clock, clear, Q[11]);
    counter_reg U12(enable, clock, clear, Q[12]);
    counter_reg U13(enable, clock, clear, Q[13]);
    counter_reg U14(enable, clock, clear, Q[14]);
    counter_reg U15(enable, clock, clear, Q[15]);

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