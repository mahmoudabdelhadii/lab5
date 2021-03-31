
fast_to_slow_sync actual_selected_signal_fasttoslow 
(
    .fast_clk(CLK_50), 
    .slow_clk(sampler), 
    .d(actual_selected_signal_fasttoslow), 
    .q(actual_selected_signal)
    );

fast_to_slow_sync actual_selected_signal_fasttoslow 
(
    .fast_clk(CLK_50), 
    .slow_clk(sampler), 
    .d(actual_selected_modulation_fasttoslow), 
    .q(actual_selected_modulation)
);

parameter [3:0] sine_signal = 4'b0000;
parameter [3:0] cos_signal = 4'b0001;
parameter [3:0] saw_signal = 4'b0010;
parameter [3:0] squa_signal = 4'b0011;

always @ (posedge clk) begin
case (signal_selector) 
        sine_signal: actual_selected_signal_fasttoslow = sin_out;
        cos_signal: actual_selected_signal_fasttoslow = cos_out;
        saw_signal: actual_selected_signal_fasttoslow = saw_out;
        squ_signal: actual_selected_signal_fasttoslow = squ_out;
        default: actual_selected_signal_fasttoslow = sin_out;
endcase
end



parameter [3:0] ASK_mod = 4'b0000;
parameter [3:0] FSK_mod = 4'b0001;
parameter [3:0] BPSK_mod = 4'b0010;
parameter [3:0] LFSR_mod = 4'b0011;

always @ (posedge clk) begin
case (modulation_selector) 
        ASK_mod:begin actual_selected_modulation_fasttoslow =  ;
        end
        FSK_mod:begin actual_selected_modulation_fasttoslow  = ;
        end
        BPSK_mod: begin actual_selected_modulation_fasttoslow = ;
        end
        LFSR_mod: begin actual_selected_modulation_fasttoslow = ;
        end
endcase
end