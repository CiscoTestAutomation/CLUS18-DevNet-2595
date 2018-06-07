# Profile System Example
# ----------------------
#
#   this script profiles system interface operational status and saves to file
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml DEVICE=uut \
#         PTSFILE=`pwd`/my_pts robot profile_system.robot

*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Test Cases ***
Initialize
    # intiialize testbed by loading it through Genie
    use genie testbed "%{TESTBED}"

Connect to devices
    connect to device "%{DEVICE}"

Save interface profile as file
    Profile the system for "interface" on devices "%{DEVICE}" as "%{PTSFILE}"
