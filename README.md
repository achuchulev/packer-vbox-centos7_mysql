# Packer template to bake VirtualBox (vagrant) CentOS7-x86_64 box with MySQL server. Use kitchen-vagrant to test that mysql service is enabled, running and listen on default port

### Purpose
This repository stores a Packer template to build a Vagrant VirtualBox CentOS7-x86_64 box with MySQL server

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

`$ packer build template.json`

After a few minutes, Packer should tell you the box was generated successfully and print the name of the artifact.

> Example:

> ==> Builds finished. The artifacts of successful builds are:
> --> centos7-x86_64-vbox: 'virtualbox' provider box: builds/virtualbox-centos7-mysql.box

### Run box

* Add vagrant box: `vagrant box add --name mysql-box builds/virtualbox-centos7-minimal.box`

* Initialize Vagrant: `vagrant init -m mysql-box`

* Start vagrant box: `vagrant up`

* connect to redis-box: `vagrant ssh`

### Change MySQL server root password

* A temporary password is generated for the MySQL root user. Locate it in the mysqld.log with command:

 * `sudo grep 'temporary password' /var/log/mysqld.log` 

* Change MySQL root password with command:

 * `sudo mysql_secure_installation`

* Test that the new password works:

 * `mysqladmin -u root -p version`

## Test box for that mysql service is enabled, running and listen on default port

### Run test

Run command `kitchen list` to check that kitchen instance is detected from kitchen.yml

Run command `kitchen test` to check the box


