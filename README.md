# Cisco Live US 2018: DevNet-2595 Workshop Material

**This workshop is deprecated - [Visit our latest workshop](https://github.com/CiscoTestAutomation/CLEUR19-DevNet-2595)**

This repository contains the files required for the participants of [Cisco Live US 2018](https://www.ciscolive.com/us/)
workshop:

DevNet-2595: Stateful Network Validation using pyATS+Genie and Robot Framework.

## General Information

- Cisco Live US: https://www.ciscolive.com/us/
- pyATS/Genie Portal: https://developer.cisco.com/site/pyats/
- Genie Documentation: https://pubhub.devnetcloud.com/media/pyats-packages/docs/genie/index.html
  - Robot Framework Keywords: https://pubhub.devnetcloud.com/media/pyats-packages/docs/genie/robot.html
  - Triggers, Verifications, Models: https://pubhub.devnetcloud.com/media/pyats-packages/docs/genie/genie_libs/index.html
- pyATS Documentation: https://developer.cisco.com/site/pyats/docs/
  - Robot Framework Keywords: https://pubhub.devnetcloud.com/media/pyats/docs/robot.html
- Community: https://communities.cisco.com/community/developer/pyats


## Requirements

- Mac OSX, Linux or Windows 10 [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Python 3.4, 3.5 or 3.6
- Network connectivity (for downloading PyPI packages)
- Access to a 2-CSR1000v topology with BGP preconfigured (provided during workshop)
- Working knowledge of Python is a plus, but not required.

## Usage Instructions

#### Step 1. Create a Python virtual environment

In a new shell window:

```bash
# create a development directory
cd ~/workspace
mkdir ~/devnet-2595
cd devnet-2595

# create python virtual environment
python3 -m venv .

# activate virtual environment
source bin/activate

# update your pip/setuptools
pip install --upgrade pip setuptools
```

#### Step 2. Install Genie, pyATS, and Robot Framework

Installing `genie` and `genie.libs.robot` will automatically install all required
dependencies, including `pyats` and `pyats.robot` Robot Framework keyword support.

```bash
# install genie and genie robot library
# (requires pip > 9.0.1)
pip install genie genie.libs.robot
```

#### Step 3. Clone this repository

```bash
# clone this repo into "repo" folder
git clone https://github.com/CiscoTestAutomation/CLUS18-DevNet-2595.git repo
```

and now you should be ready to get going!


## Repository Content

```text
    testbeds/                         testbed YAML files to be used during Cisco Live
    testbeds/backup/                  backup testbeds in case primary had issues
    configs/                          configurations applied to both CSR1000v devices
    scripts/                          example scripts to be worked on during the workshop
```
