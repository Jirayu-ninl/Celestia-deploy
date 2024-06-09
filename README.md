# Celestia-deploy

`cd /home
sudo mkdir celestia`

1. To change the ownership of a folder to the current user, use the chown command:
`sudo chown $USER:$USER celestia`

2. If you also need to change the permissions to ensure that the user has read, write, and execute permissions, use the chmod command:
`sudo chmod 755 /celestia`

**for full permissions**
`sudo chmod 777 /celestia`

run `git clone https://github.com/Jirayu-ninl/Celestia-deploy.git .`

`
chmod +x pre.sh
chmod +x app-cosmos.sh
chmod +x start.sh
`