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

