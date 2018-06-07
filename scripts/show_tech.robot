# Show Tech Example
# -----------------
#
#   this script saves the show tech output to file
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml DEVICE=uut \
#         OUTFILE=uut_show_tech.txt robot show_tech.robot

*** Settings ***
Library        OperatingSystem
Library        ats.robot.pyATSRobot
Library        unicon.robot.UniconRobot


*** Variables ***
${timeout}     900


*** Test Cases ***
Load testbed
    # load testbed file
    use testbed "%{TESTBED}"

Connect to devices
    connect to device "%{DEVICE}"
    set unicon execute timeout to "${timeout}" seconds

Collect Show Tech
    ${output}=  execute "show tech" on device "%{DEVICE}"
    create file  %{OUTFILE}  ${output}