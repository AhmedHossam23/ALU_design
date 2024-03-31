module LET_SEG(
  input [3:0]num,
  output reg [6:0]seg
  );
  always@(num)
  begin
    case(num)
      4'b0001:
      seg<=7'b0001000;
      4'b0010:
      seg<=7'b1100000;
      4'b0100:
      seg<=7'b0110001;
      default:
      seg<=7'b1111111;
    endcase
  end
endmodule
