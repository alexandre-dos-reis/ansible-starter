# servers-infra

An ansible project for installing and managing my servers. It provides a simple and easy way to reproduce servers given by a provider like OVH.

This project assumes you will use an UNIX OS.

## Dependencies

This project uses :

- VirtualBox >= 6.1
- Vagrant >= 2.3.3
- Taskfile >= 3.18.0
  
## How to use this project

You need to install the dependencies above depending on your OS, then you can install the vagrant plugins with:

```
task install:deps
```

This setup will install ansible on a vm called `conductor` and 2 test `nodes`. You'll have to adjust the `config.yml` and `inventory.yml` files to your needs. You need to:

- Create or use an existing private/public key pair that ansible will use and give the path to `config.yml`
- Put the `conductor` ip address, 
- Define `netmask` for the conductor and nodes VMs. 
- Define the network bridge for all the VMs.

These files will be read by Vagrant to launch the virtual machines, so don't mess them up !

Then you can launch the creation of the VMs with :

```
task up
```

You can test that the config is valid with the command:

```
task ansible:prepare
```

This will create the ansible user and copy the public key to the `known_hosts` file for the `nodes`. You can read the playbook here `playbooks/00_prepare.yml`.

If this succeed, you can connect to the conductor with :

`task conductor:ssh`

Enter your passphrase key if you have one, and start working on your project.

You can test that the ansible user was well created with :

`ansible-playbook playbooks/01_test.yml`

For others availables commands, just write (outside of the VM):

`task`

## Documents

- [recette docker ultransible](https://github.com/ultransible/docker)
- [geerlingguy ansible-role-security](https://github.com/geerlingguy/ansible-role-security)
- [Xavki playlist Gitlab Docker](https://gitlab.com/xavki/presentation-ansible-fr)
- [Specify Vagrantfile path explicity, if not plugin](https://stackoverflow.com/questions/17308629/specify-vagrantfile-path-explicity-if-not-plugin)