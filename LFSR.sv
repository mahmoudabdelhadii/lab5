module LFSR (clock, reset, LFSR_inbus, LFSR_outbus);

input           clock,reset;
input[4:0]          LFSR_inbus;
output[4:0]          LFSR_outbus;
reg [4:0]LFSR_outbus;
reg [4:0]clock, reset;
always @(posedge clock, posedge reset) begin 
    if(reset)begin
        LFSR_outbus <= LFSR_inbus;
    end
    else begin
        LFSR_outbus[4]<=LFSR_outbus[2] ^ LFSR_outbus[0];
        LFSR_outbus[3] <= LFSR_outbus[4];
        LFSR_outbus[2] <= LFSR_outbus[3];
        LFSR_outbus[1] <= LFSR_outbus[2];
        LFSR_outbus[0] <= LFSR_outbus[1];
    end
end
endmodule




parameter [3:0] sine_signal = 4'b0000;
parameter [3:0] cos_signal = 4'b0001;
parameter [3:0] saw_signal = 4'b0010;
parameter [3:0] square_signal = 4'b0011;

always @ (posedge clk) begin
case (signal_selector) 
        sine_signal: actual_selected_signal<= sin_out;
        cos_signal: actual_selected_signal<= cos_out;
        saw_signal: actual_selected_signal<= saw_out;
        squ_signal: actual_selected_signal<= squ_out;
endcase
end

