@echo off
set xv_path=D:\\ProgramFiles\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 934447aa2a2c4534990ecde44b423000 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot dataRead_test_behav xil_defaultlib.dataRead_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
