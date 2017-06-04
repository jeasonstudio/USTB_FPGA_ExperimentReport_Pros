@echo off
set xv_path=D:\\ProgramFiles\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim dataRead_test_behav -key {Behavioral:sim_1:Functional:dataRead_test} -tclbatch dataRead_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
