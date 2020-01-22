`timescale 1ns/1ns
`default_nettype none

module test_7seg;
  localparam clk_half_period = 10;
  localparam rst_period = 30;
  localparam sim_time = 4000;
  reg clk;
  reg rst_x;

  initial begin
    clk = 0;
    forever begin
      #(clk_half_period);
      clk = ~clk;
    end
  end

  reg [3:0] din = 4'd0;
  reg dot_en = 1'b0;
  always @(posedge clk or negedge rst_x) begin
    if(~rst_x) begin
      din <= 4'd0;
      dot_en <= 1'b0;
    end else begin
      din <= $random;
      dot_en <= $random;
    end
  end

  wire [7:0] dout;
  SevenDec sdec (din, dot_en, dout);

  initial begin
    $dumpfile("sdec.vcd");
    $dumpvars(0, sdec);
  end

  initial begin
    #(sim_time);
    $finish;
  end
  
endmodule

    

`default_nettype wire
