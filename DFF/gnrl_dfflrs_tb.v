`timescale 1ns / 1ps
module gnrl_dfflrs_tb # (
    parameter DW = 32
) (
    output [DW-1:0] qout,
    input [DW-1:0] dnxt,

    input lden,
    input clk,
    input rst_n
);

  always begin
    #10 clk = ~clk;
  end

    //初始化
  initial begin
    //$display("begin simulate");
    $dumpfile("DFF/wave.vcd");  //
    $dumpvars(0, dff_tb);
    clk = 1'b0;
    //clr = 1'b0;
    rst_n = 1'b0;
    dnxt   = 1'b0;
    #10 rst_n = 1'b1;  //10ns后复位信号有效，此刻应该输出置1
    dnxt = 1'b1;  //又过10ns，清零信号有效，且复位信号也继续有效，但清零信号优先级高，所以，此刻输出应该清零
    rst_n = 1'b0; //又过了10ns，此刻复位和清零信号均无效，此刻输出应该保持当且输入的状态，也就是高电平
    #20 d = 1'b0;
    #20 d = 1'b1;

    #300 $finish;
  end

  gnrl_dfflrs #(
      .DW(32)
  ) u_gnrl_dfflrs (
      .lden (lden),
      .dnxt (dnxt),
      .qout (qout),
      .clk  (clk),
      .rst_n(rst_n)
  );
endmodule