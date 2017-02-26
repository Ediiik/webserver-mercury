# Mercury, the webserver

Mercury is one of webservers for local development based on Vagrant provisioning. 
It's **not recommended** to use this box on you production environment.

## Environment

### Software

- OS: Ubuntu 16.04 (ubuntu/xenial64)
- Webserver: Apache 2.4
- PHP: 7.0
- MySQL 5.7

### Virtual hosts

Virtual hosts are configured to match the `*.app` and `*.*.app` patterns so you can have multiple websites
running in one mercury instance. Source code is synchronized from you host machine 
(configure the folder in Vagrantfile) to guest machine at `/home/ubuntu/www`. Domain names are resolved 
by the project folder. 

Let's say you have `syncFolder` configured to `~/Code` and you have a project `~/Code/my-project`.
You can visit `my-project.app` or `www.my-project.app` and Mercury will try to serve your project from
`/home/ubuntu/www/my-project` which is synced with your `~/Code/my-project`.


## Installation

Clone this repository to your desired location. Copy the Vagrantfile.example and customize the `ipAddress` 
and `syncFolder` to suite your needs. Then just simply run `vagrant up` and the vagrant will provision
the machine to desired state by running the shell scripts included in this repo.

## Daily usage tips

Register function in your `~/.bashrc` (or other `*rc` file depending on your shell, for example `~/.zshrc`) to have global 
access to your mercury via `mercury` command. Don't forget to change the path
in the function to suite your needs.
```shell
function mercury() {
    ( cd ~/path/to/your/mercury && vagrant $* )
}
```
Then you will be able to run `mercury up`, `mercury halt` and every `vangrant [command]` globaly.