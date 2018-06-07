# Load Configuration Example
# --------------------------
#
#   this script loads configuration from file and apply to device
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml \
#         DEVICE=uut CONFIG=../configs/csr1000v-1.cfg robot load_config.robot

*** Settings ***
Library        OperatingSystem
Library        ats.robot.pyATSRobot
Library        unicon.robot.UniconRobot


*** Variables ***
${timeout}     120

*** Test Cases ***
Load testbed
    # load testbed file
    use testbed "%{TESTBED}"

Connect to devices
    connect to device "%{DEVICE}"
    set unicon configure timeout to "${timeout}" seconds

Load Configuration
    ${configuration}=  get file  %{CONFIG}
    configure "${configuration}" on device "%{DEVICE}"
