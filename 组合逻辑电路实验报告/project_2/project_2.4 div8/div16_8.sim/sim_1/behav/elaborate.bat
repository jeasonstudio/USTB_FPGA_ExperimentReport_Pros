@echo off
set xv_path=G:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 28b939f519d342f2b22ba2154aba7d61 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot div16_8_tb_behav xil_defaultlib.div16_8_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
