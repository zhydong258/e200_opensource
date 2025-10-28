module gnrl_dfflrs # (
  parameter DW = 32
) (

  input               lden,
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : DFFLRS_PROC
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b1}};
  else if (lden == 1'b1)
    qout_r <= #1 dnxt;
end

assign qout = qout_r;

`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
sirv_gnrl_xchecker # (
  .DW(1)
) sirv_gnrl_xchecker(
  .i_dat(lden),
  .clk  (clk)
);
//synopsys translate_on
`endif//}
`endif//}


endmodule