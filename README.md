# vagrant-chef


# Requirements 
 - Vagrant env, either run setup.bat before running vagrant or execute the following command: 
 	`vagrant plugin install vagrant-env`

 In case the usage of vagrant-env plugin is not possible, you might want to replace the required value directly into Vagrantfile and deactivate the plugin (just add # to the begining of the line)

 - `#config.env.enable `

# Environment variables:
create an .env file and fill it with the following environment variables:

 - `VM_MEMORY=VALUE`  
 - `VM_CPU_COUNT=VALUE`  

Chef-server require at least 2048 RAM & 2 cpu core
Other can get by 512 RAM and 1 core

Extra env. variables for chef-server:

 - `VM_HOSTNAME=VALUE`
 - `VM_PRIVATE_IP_ADDRESS=VALUE`

Tested under windows10 pro with hyperV
