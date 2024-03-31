module MUX(
  input[1:0]clk_out,
  input[3:0]ones,
  input[3:0]tens,
  input[3:0]hundreds,
  input[3:0]letter,
  output reg[3:0]num,
  output reg[3:0]an_sel
  );
  always@(*)
  begin
    case(clk_out)
      2'b00: begin num = ones; an_sel=4'b0111; end 
      2'b01: begin num = tens; an_sel=4'b1011; end
      2'b10: begin num = hundreds; an_sel=4'b1101; end
      2'b11: begin num = letter; an_sel=4'b1110; end
    endcase
  end
  endmodule
