# Connection Example
# ------------------
#
#   this is a very simple robot script. The goal of this script is to help you
#   understand how libraries are loaded, how to write testcases, run and
#   collect results
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml robot connection.robot

*** Settings ***
# pyATS robot framework keywords
#   https://developer.cisco.com/docs/pyats/
#   > RobotFramework Support -> pyATs Keywords
#   (https://pubhub.devnetcloud.com/media/pyats/docs/robot.html)
Library        ats.robot.pyATSRobot

# Unicon robot framework keywords
#   https://developer.cisco.com/site/pyats/docs/packages/
#   > Unicon > RobotFramework Support -> Unicon Keywords
#   (https://pubhub.devnetcloud.com/media/pyats-packages/docs/unicon/robot.html)
Library        unicon.robot.UniconRobot

*** Variables ***
${testbed}     %{TESTBED}

*** Test Cases ***
Load testbed
    # load testbed file
    use testbed "${testbed}"

Connect to devices
    connect to device "uut"
    connect to device "helper"

Issue commands
    execute "show version" on device "uut"
    execute "show platform" on device "helper"

Configuration Example
    ${config}=  catenate  SEPARATOR=\n
    ...     interface GigabitEthernet3
    ...     shutdown
    configure "${config}" on device "uut"
    execute "show interface" on device "uut"