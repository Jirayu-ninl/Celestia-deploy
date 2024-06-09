# Celestia Project

by TheIceJi: [TheIceJi.com](https://theiceji.com)

### Setup Celestia
1. cwd:
`cd /home`

2. Download the script:
`curl -O https://assets.theiceji.com/deploy/celestia.sh`
or
`wget https://assets.theiceji.com/deploy/celestia.sh`

3. Make the Script Executable:
`chmod +x celestia.sh`

4. Execute the Script:

- For the initial setup:
`./celestia.sh --init`

- For regular workflow:
`./celestia.sh`

### Run Celestia
1. cwd:
`cd /home`

2. Download the script:
`curl -O https://assets.theiceji.com/deploy/celestia-start.sh`
or
`wget https://assets.theiceji.com/deploy/celestia-start.sh`

3. Make the Script Executable:
`chmod +x celestia-start.sh`

4. Add command to Daemon:

`/home/celestia-start.sh` and args `-a ${appName}` (app) or `-s` (servers)