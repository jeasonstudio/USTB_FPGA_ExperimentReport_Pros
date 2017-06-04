@echo off
set xv_path=G:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim mult8_tb_behav -key {Behavioral:sim_1:Functional:mult8_tb} -tclbatch mult8_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
