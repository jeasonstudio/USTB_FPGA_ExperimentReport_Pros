@echo off
set xv_path=D:\\Vivado\\2015.4\\bin
call %xv_path%/xsim test_behav -key {Behavioral:sim_1:Functional:test} -tclbatch test.tcl -view E:/zhj/flow_light/test_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
