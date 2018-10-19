# Packer template to bake vagrant box with MySQL. A kitchen-vagrant test is included

### Purpose
This repository stores a Packer template to build a CentOS7-x86_64 Vagrant box for VirtualBox that have MySQL server istalled

### Requirements
The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

* Packer
* VirtualBox (needed to build the VirtualBox box)
* Vagrant

### CentOS Packer Template:

* [template.json](https://github.com/achuchulev/packer-vbox-centos7_mysql/blob/master/template.json)

### Download repo from source locally

Clone to repository locally: `git clone git@github.com:achuchulev/packer-vbox-centos7_mysql.git`

### Build box

Go to the directory containing template.json file, and run:

```
cd packer-vbox-centos7_mysql
packer build template.json

```

### Run box

* Initialize Vagrant: `vagrant init -m centos7-mysql`

* Start vagrant box: `vagrant up`

* Connect to the box: `vagrant ssh`

### Change MySQL server root password

* A temporary password is generated for the MySQL root user. Locate it in the mysqld.log with command:

`sudo grep 'temporary password' /var/log/mysqld.log` 

* Change MySQL root password with command:

`sudo mysql_secure_installation`

* Test that the new password works:

`mysqladmin -u root -p version`

## Test the box 

### Prerequisite - a Test Kitchen Driver for Vagrant is installed

* If using the ChefDK, kitchen-vagrant is already installed. If using an existing Ruby install:

`gem install kitchen-vagrant`

### Run test

Run command `kitchen list` to verify that vagrant box is ready to be tested

Run command `kitchen test` to check that mysql-server is installed, mysql service is enabled and running, default mysql port is tcp 3306, mysql configuration file exists at the default location, has right permissions and is owned by root 
