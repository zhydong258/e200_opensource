 /*
 Copyright 2018 Nuclei System Technology, Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */



//=====================================================================
// Designer   : Bob Hu
//
// Description:
//  The mini-decode module to decode the instruction in IFU
//
// ====================================================================
`include "e203_defines.v"

module e203_ifu_minidec(

  //////////////////////////////////////////////////////////////
  // The IR stage to Decoder
  input  [`E203_INSTR_SIZE-1:0] instr, // 取回的指令输入进行部分译码

  //////////////////////////////////////////////////////////////
  // The Decoded Info-Bus

  // ANSI C风格的端口声明，即在端口列表中给出端口的完整信息

  // riscv中的指令比较工整，需要读取的寄存器最多为两个，rs1和rs2,写入的只有一个rd
  // rs1和rs2可以通过索引指定到不同的通用寄存器，通用寄存器32个，所以索引位数为5
  output dec_rs1en, // 指令需要读rs1
  output dec_rs2en, // 指令需要读rs1
  output [`E203_RFIDX_WIDTH-1:0] dec_rs1idx, // 指令需要读rs1, 这个rs1的索引是多少
  output [`E203_RFIDX_WIDTH-1:0] dec_rs2idx, // 指令需要读rs2, 这个rs2的索引是多少

  output dec_mulhsu, // 属于哪种指令类型
  output dec_mul   ,
  output dec_div   ,
  output dec_rem   ,
  output dec_divu  ,
  output dec_remu  ,

  output dec_rv32, // 当前指令是16还是32位
  output dec_bjp, // 指令是普通指令还是分支跳转指令，即 assign dec_bjp = dec_jal | dec_jalr | dec_bxx;
  output dec_jal,
  output dec_jalr,
  output dec_bxx,
  output [`E203_RFIDX_WIDTH-1:0] dec_jalr_rs1idx, // 该指令是jalr指令，其使用的rs1索引是多少
  output [`E203_XLEN-1:0] dec_bjp_imm

  );

  // 实例化exu单元中的decode，把不用的输入置0，不用的输出悬空
  e203_exu_decode u_e203_exu_decode(

  .i_instr(instr),
  .i_pc(`E203_PC_SIZE'b0),
  .i_prdt_taken(1'b0),
  .i_muldiv_b2b(1'b0),

  .i_misalgn (1'b0),
  .i_buserr  (1'b0),

  .dbg_mode  (1'b0),

  .dec_misalgn(),
  .dec_buserr(),
  .dec_ilegl(),

  .dec_rs1x0(),
  .dec_rs2x0(),
  .dec_rs1en(dec_rs1en),
  .dec_rs2en(dec_rs2en),
  .dec_rdwen(),
  .dec_rs1idx(dec_rs1idx),
  .dec_rs2idx(dec_rs2idx),
  .dec_rdidx(),
  .dec_info(),
  .dec_imm(),
  .dec_pc(),


  .dec_mulhsu(dec_mulhsu),
  .dec_mul   (dec_mul   ),
  .dec_div   (dec_div   ),
  .dec_rem   (dec_rem   ),
  .dec_divu  (dec_divu  ),
  .dec_remu  (dec_remu  ),

  .dec_rv32(dec_rv32),
  .dec_bjp (dec_bjp ),
  .dec_jal (dec_jal ),
  .dec_jalr(dec_jalr),
  .dec_bxx (dec_bxx ),

  .dec_jalr_rs1idx(dec_jalr_rs1idx),
  .dec_bjp_imm    (dec_bjp_imm    )
  );


endmodule
