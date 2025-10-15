RISC-V Prebuilt Tools
================

Links
-----------

To ease your usage, the prebuilt RISC-V ToolChain can be downloaded from the link: https://pan.baidu.com/s/1eUbBlVc

-----------
根目录下的`prebuild_tools`文件夹，就是用来在README的文件中说明上面的工具下载地址的，实际下载后的工具会被连接到`riscv-tools\prebuild_tools\prefix\bin`下面。

参见 P297 17.2 E200开源项目的测试用例

步骤四：由于编译汇编程序需要使用到GNU工具链，假设使用完整的 riscv-tools 来自己编译 GNU
工具链则费时费力，因此本书推荐使用预先已经编译好的 GCC 工具链。作者已经将工具链上传至网盘，网盘
具体地址记载于 e200_opensource 项目 prebuilt_tools 目录的 README 中。用户可以在网盘中的
“RISC-V Software Tools/RISC-V_GCC_201801_Linux”目录下载压缩包
gnu-mcu-eclipse-riscv-none-gcc-7.2 0-2-20180111-2230-centos64.tgz ，然后按照如下步骤
解压使用。

```
cp gnu-mcu-eclipse-riscv-none-gcc-7.2 0-2-20180111-2230-centos64.tgz ~／
／／将压缩包复制到用户的根目录下
cd ~/ 
tar -xzvf gnu-mcu-eclipse-riscv-none-gcc-7.2 0-2-20180111-2230-centos64.tgz
／／进入根目录并解压该压缩包 解压后可以看到一个生成的 gnu-mcu-eclipse 文件夹
cd <your_e200_dir>/ 
／／进入到 e200_opensource 的目录文件夹
mkdir -p ./riscv_tools/prebuilt_tools/prefix/bin 
／／在 e200 opensource 目录下创建上述这个 bin 目录
cd ./riscv_tools/prebuilt_tools/prefix/bin/
／／进入到这个新建的 bin 目录下
ln－s ～／gnu-mcu-eclipse/riscv-none-gcc/7.2 0-2-20180111-2230/bin/*  .
／／将用户根目录下解压压缩包中 bin 目录下的所有可执行文件作为软链接链接到
／／该 riscv-tools/prebuilt_tools/prefix/bin／目录下
```
