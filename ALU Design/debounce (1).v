module debouncer (clk,PB,db_pb);
  input clk,PB;
  output db_pb;
  reg delay1,delay2,delay3;
always@(posedge clk)
begin
if(clk==1 && PB==1)
  begin
  delay1<=PB;
  delay2<=delay1;
  delay3<=delay2;
end
else
  begin
  delay1<= 0;
  delay2<= 0;
  delay3<= 0;
end
end
assign db_pb = delay1&delay2&delay3;
endmodule
