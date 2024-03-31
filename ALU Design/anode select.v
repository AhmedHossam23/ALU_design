/*module AN_SEL(
  input clk_out,
  output reg[3:0]AN=4'b0,
  output reg[3:0]num_sel=4'b1111
  );
  integer i;
  always@(posedge clk_out)
  begin
    AN <= AN + 1;
    for(i=0;i<7;i=i+1)
      begin
        if (AN >7)
          begin
            AN <= 4'b0000;
            num_sel <= 4'b1111;
          end
        else
          begin
            num_sel <= ~AN-1;
          end
      end
  end
endmodule*/
