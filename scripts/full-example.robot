# Full Example
# ------------
#
#   this is a full-on pyATS/Genie long example that provides examples on
#   multiple keywords and use cases.
#
#   make sure to always pass a testbed to this file when you run it.
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml robot full-example.robot

*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot

*** Variables ***
${pts_file}    ${CURDIR}/pts
${testbed}     %{TESTBED}

*** Test Cases ***
Initialize
    # intiialize testbed by loading it through Genie
    use genie testbed "${testbed}"

Connect to devices
    # establish connection to both the uut and helper devices
    connect to device "uut"
    connect to device "helper"

Profile all devices and save to file
    # profile bgp & ospf features on both testbed devices
    # save profiled objects into current working directory named "pts"
    Profile the system for "bgp;ospf" on devices "uut;helper" as "${pts_file}"

Get device (uut) information
    # issue some commands on device, and save them to the log
    execute "show version" on device "uut"
    execute "show platform diag" on device "uut"

Learn current BGP state
    # save current BGP state by calling bgp summary parser, and saving it
    # internally for future reference
    run verification "Verify_BgpAll" on device "uut"

Trigger UnconfigConfig BGP
    # toggle bgp configuration, and verify that bgp returns to normal
    run trigger "TriggerUnconfigConfigBgp" on device "uut" using alias "cli"

Verify BGP state after trigger
    # verify bgp state against the first time this verification was called
    # ensure nothing changed
    run verification "Verify_BgpAll" on device "uut"

Verify BGP neighbor count
    # check specific bgp neighbor count
    verify count "1" "bgp neighbors" on device "uut"

Verify BGP routes
    # check specific bgp route counts
    verify count "2" "bgp routes" on device "uut"

Profile all devices and save to variable
    # profile bgp & ospf feature again on both testbed devices,
    # but this time save to a named variable internally
    profile the system for "bgp;ospf" on devices "uut;helper" as "current"

Compare profiles: before and after
    # now compare the profiles we saved initially at the start
    # versus the one we saved at the end into variable
    Compare profile "${pts_file}" with "current" on devices "uut;helper"
