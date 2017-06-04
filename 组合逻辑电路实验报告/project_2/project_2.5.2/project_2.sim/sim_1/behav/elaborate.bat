@echo off
set xv_path=G:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto c7e743e86de3442db3592cca28d02aa8 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
