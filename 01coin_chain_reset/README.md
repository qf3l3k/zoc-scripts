# 01coin Blockchain Reset
Helpful Bash script and Ansible playbook to reload blockchain to 01coic (ZOC) masternodes in case it stucks and has to be re-sync'd. It is much faster method than bootstrap import.

## Ansible playbook
Execution is done by Ansible engine and orchestrated in Ansible playbook.

In 01coin_chain_reset.yaml you need to adjust source and destination of blockchain archive to reflect settings in your system. Two lines contain full path and archive name:

```shell script
src: /full/patch/to/blockchain/archive/chain_01coin.tar.gz
dest: /root/.zeroonecore/chain_01coin.tar.gz
```

Ansible playbook has to be informed on which group of hosts playbook should be ran:

```shell script
hosts: 01coin
```

So, you need to update it accordingly to reflect host group you have configured in your Ansible instance.

### Blockchain archive file
chain_01coin.tar.gz file contains blockchain from working masternode and has 2 folders archived:
 - blocks
 - chainstate


## Bash script
Bash script does all the work on remote node and has to be adjusted accordingly as well.
In 01coin_chain_reset.sh you have to modify 3 variables to reflect configuration of the remote system:

```shell script
COIN_FOLDER="/root/.zeroonecore"
BLOCKCHAIN_ARCHIVE_GZ="chain_01coin.tar.gz"
BLOCKCHAIN_ARCHIVE="chain_01coin.tar"
```
Please note that remote Bash script assumes that 01coin masternode is installed as a service.
In case you don't have it installed that way take a look into script in this repo:
https://github.com/qf3l3k/zoc_install 

## Running Playbook and Bash script
Once all is set you can simply run playbook with Ansible:

```shell script
ansible-playbook 01coin_chain_reset.yaml
```

Enjoy automated 01coin masternode reset!

# License
01coin Blockchain Reset is released under the terms of the MIT license.
