`default_nettype none
/*

  0
  __
 |5 |1
  __ 6
 |4 |2
  __3
 
 dot = 7
 
 low active 
 */

module SevenDec #(parameter DW = 4) // Hexadecimal input
  (input  wire [DW-1:0] din,
   input  wire dot_en,
   output wire [7:0] dout);

  function [6:0] seven_dec
    (input  [DW-1:0] din);
    begin
      case(din)
        4'd0: begin
          seven_dec = 7'b1000000;
        end
        4'd1: begin
          seven_dec = 7'b1111001;
        end
        4'd2: begin
          seven_dec = 7'b0100100;
        end
        4'd3: begin
          seven_dec = 7'b0110000;
        end
        4'd4: begin
          seven_dec = 7'b0011001;
        end
        4'd5: begin
          seven_dec = 7'b0010010;
        end
        4'd6: begin
          seven_dec = 7'b0000010;
        end
        4'd7: begin
          seven_dec = 7'b1011000;
        end
        4'd8: begin
          seven_dec = 7'b0000000;
        end
        4'd9: begin
          seven_dec = 7'b0010000;
        end
        4'd10: begin // HEX A
          seven_dec = 7'b0001000;
        end
        4'd11: begin // HEX B -> "small" b not 6
          seven_dec = 7'b0000011;
        end
        4'd12: begin // HEX C
          seven_dec = 7'b1000110;
        end
        4'd13: begin // HEX D -> "small" d
          seven_dec = 7'b0100001;
        end
        4'd14: begin // HEX E
          seven_dec = 7'b0000110;
        end
        4'd15: begin // HEX F
          seven_dec = 7'b0001110;
        end
      endcase
    end
  endfunction
  
  assign dout = {~dot_en, seven_dec(din)};

endmodule


`default_nettype wire
