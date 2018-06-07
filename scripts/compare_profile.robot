# Compare System Example
# ----------------------
#
#   this script compares system interface operational status versus input file
#
#   bash$ TESTBED=../testbeds/CLUS18-PROD-1.yaml DEVICE=uut \
#         PTSFILE=my_pts robot compare_profile.robot

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

Save interface profile as variable
    Profile the system for "interface" on devices "%{DEVICE}" as "current"

Compare saved profile to current
    Compare profile "%{PTSFILE}" with "current" on devices "%{DEVICE}"

