module ALU(
input [7:0]SW,
input clk,
input rst,
input db_pb0,
input db_pb1,
input db_pb2,
output reg [7:0]LED,
output reg [8:0]BI,
output reg [3:0]letter
);
  reg[7:0]A=8'b0;
  reg[7:0]B=8'b0;
  reg[7:0]result=8'b0;
  reg carry=1'b0;
  always@(posedge clk or db_pb0 or db_pb1 or db_pb2 or rst)
  begin
    if(db_pb0==1)
      begin
      A<=SW;
      result<=A;
      carry=1'b0;
      letter<=4'b1010;
      BI<=A;
    end
    else if(db_pb1==1)
      begin
      B<=SW;
      result<=B;
      carry=1'b0;
      letter<=4'b1011;
      BI<=B;
    end
  else if(db_pb2 == 1)
      begin
        letter<=4'b1100;
        case(SW)
          8'b0000_0001: begin {carry,result}=A+B; BI<={carry,result}; end
          8'b0000_0010: begin carry=0; {carry,result}<=A-B; BI={carry,result}; end
          8'b0000_0011: begin carry=0; result= ~A; BI<={carry,result}; end
          8'b0000_0100: begin carry=0; result=A&B; BI<={carry,result}; end
          8'b0000_0101: begin carry=0; result=A|B; BI<={carry,result}; end
          8'b0000_0110: begin carry=0; result=A^B; BI<={carry,result}; end
          default: begin carry=0; result=8'b00000000; BI<={carry,result}; end
        endcase
      end
    else if(rst==1)
      begin
      A<= 8'b00000000;
      B<= 8'b00000000;
      result<=8'b00000000;
      carry<=1'b0;
      BI<={carry,result};
      letter<= 4'b0000;
    end
  assign LED=SW;
  end
    endmodule
          
      
  