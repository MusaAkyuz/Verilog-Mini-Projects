# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/musak/RandomCircuit/RandomCircuit.cache/wt [current_project]
set_property parent.project_path C:/Users/musak/RandomCircuit/RandomCircuit.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.3 [current_project]
read_verilog -library xil_defaultlib C:/Users/musak/RandomCircuit/RandomCircuit.srcs/sources_1/new/tumleyenlicikarma.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top tumleyenlicikarma -part xc7a200tfbg676-2


write_checkpoint -force -noxdef tumleyenlicikarma.dcp

catch { report_utilization -file tumleyenlicikarma_utilization_synth.rpt -pb tumleyenlicikarma_utilization_synth.pb }
