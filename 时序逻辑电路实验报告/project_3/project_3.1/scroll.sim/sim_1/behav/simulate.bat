@echo off
set xv_path=D:\\game\\Vivado\\2015.4\\bin
call %xv_path%/xsim GPU_tb_behav -key {Behavioral:sim_1:Functional:GPU_tb} -tclbatch GPU_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
