//dff.v
//1位D触发器Verilog HDL程序代码
module dff(clk,clr,rst,d,q);
    input clk;
    input clr,rst;
    input d;
    output q;
    reg q;
    always@(posedge clk or posedge clr) //敏感源为时钟上升沿或清零信号的上升沿（异步清零）
    begin
        if(clr == 1'b1) //清零信号有效时（高电平），输出清零
            q <= 1'b0;
        else if(rst == 1'b1) //复位信号有效时（高电平），输出置1（同步置1）
            q <= 1'b1;
        else //二者都无效时，输出保持当前状态
            q <= d;
    end
endmodule
