module BCD(clk,rst_asyn,Load,Din,Q_out,Q);
input clk;
input rst_asyn,Load;
input [3:0]Din;
output [3:0]Q;
reg [3:0]Q;
output [6:0]Q_out;
reg [6:0]Q_out;

always@ (posedge clk)
begin

if (!rst_asyn)
    Q=0;
else if (Load)
    Q=Din;
else if (Q == 9)
    Q=0;
else
    Q+=1;
end

always@ (*)
begin
    case (Q)
        4'b0000 : Q_out = 7'b1000000;
        4'b0001 : Q_out = 7'b1111001;
        4'b0010 : Q_out = 7'b0100100;
        4'b0011 : Q_out = 7'b0110000;
        4'b0100 : Q_out = 7'b0011001;
        4'b0101 : Q_out = 7'b0010010;
        4'b0110 : Q_out = 7'b0000010;
        4'b0111 : Q_out = 7'b1111000;
        4'b1000 : Q_out = 7'b0000000;
        4'b1001 : Q_out = 7'b0010000;
        default : Q_out = 7'b0000000;
    endcase
end
endmodule

