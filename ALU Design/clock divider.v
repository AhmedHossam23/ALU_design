module CLK_DIV(input clk,
output [1:0] clk_out
);
reg [19:0]count=20'd0;
reg [19:0]divisor=20'd500000;
always @(posedge clk)
begin
   count <= count + 1;
   if(count >= (divisor-1))
      count<=20'd0;
      //clk_out <= (count<divisor/2)?1'b1:1'b0;
end

assign clk_out = count[18:17];
endmodule