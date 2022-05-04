module  BCD_tb;
  reg clk,rst_asyn,Load;
  reg [3:0]Din;
  wire [3:0]Q;
  wire [6:0]Q_out;
  parameter PERIOD=20;
  parameter real DUTY_CYCLE=0.5;
  parameter OFFSET=0;
initial begin
  #OFFSET;
  forever begin
    clk=1'b1;
    #(PERIOD-(PERIOD*DUTY_CYCLE)) clk=1'b0;
    #(PERIOD*DUTY_CYCLE);
  end
end
initial begin
  Din= 4'b0010;
  rst_asyn=1'b0;
  Load=1'b1;
  #5   rst_asyn=1'b1;
  #10  Load=1'b0;
  #50  rst_asyn=1'b0;
  #10  Load=1'b1;
  #5   rst_asyn=1'b1;
  #10  Load=1'b0;
  #200 $finish;
end
initial begin
$dumpfile("BCD.vcd");
  $dumpvars(0, BCD_tb);
end
  BCD BCD_tb(
    .clk(clk),
    .rst_asyn(rst_asyn),
    .Load(Load),
    .Din(Din),
    .Q_out(Q_out),
    .Q(Q)
  );
endmodule