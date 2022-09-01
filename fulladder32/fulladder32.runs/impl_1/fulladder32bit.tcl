proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a200tfbg676-2
  set_property board_part xilinx.com:ac701:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/musak/fulladder32/fulladder32.cache/wt [current_project]
  set_property parent.project_path C:/Users/musak/fulladder32/fulladder32.xpr [current_project]
  set_property ip_repo_paths c:/Users/musak/fulladder32/fulladder32.cache/ip [current_project]
  set_property ip_output_repo c:/Users/musak/fulladder32/fulladder32.cache/ip [current_project]
  add_files -quiet C:/Users/musak/fulladder32/fulladder32.runs/synth_1/fulladder32bit.dcp
  link_design -top fulladder32bit -part xc7a200tfbg676-2
  write_hwdef -file fulladder32bit.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force fulladder32bit_opt.dcp
  report_drc -file fulladder32bit_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force fulladder32bit_placed.dcp
  report_io -file fulladder32bit_io_placed.rpt
  report_utilization -file fulladder32bit_utilization_placed.rpt -pb fulladder32bit_utilization_placed.pb
  report_control_sets -verbose -file fulladder32bit_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force fulladder32bit_routed.dcp
  report_drc -file fulladder32bit_drc_routed.rpt -pb fulladder32bit_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file fulladder32bit_timing_summary_routed.rpt -rpx fulladder32bit_timing_summary_routed.rpx
  report_power -file fulladder32bit_power_routed.rpt -pb fulladder32bit_power_summary_routed.pb -rpx fulladder32bit_power_routed.rpx
  report_route_status -file fulladder32bit_route_status.rpt -pb fulladder32bit_route_status.pb
  report_clock_utilization -file fulladder32bit_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

