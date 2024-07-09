# README - compile and run pgModeler using a Virtualbox VM

This repository will give you a pgModeler binary install for Ubuntu  running on a virtual machine.  It will download the tarball for the given version of pgModeler, build and install it.


## How to use this repository

* Clone the repo

```bash
git clone https://github.com/CesarBallardini/pgModeler.git
```

* You can set the version of the program to build in `Vagrantfile`. The builder will work for pgModeler versions that uses Qt6.  You need to change the variable like:

```bash
PGMODELER_VERSION="1.1.3"
````

* Launch the virtual machine

```bash
cd pgModeler/
time vagrant up
# it took 30 minutes approx.
```

* Run the pgModeler program

```bash
vagrant ssh -c /usr/local/bin/pgmodeler
```

## Appendix A: Requisites

This was tested using Ubuntu 22.04.4 (2024-07-07):

* Virtualbox `7.0.18-162988~Ubuntu~jammy`
* Vagrant 2.4.1-1
* Vagrant plugins: 
  * vagrant-cachier 1.2.1
  * vagrant-hostmanager 1.8.10
  * vagrant-proxyconf 2.0.10
  * vagrant-rekey-ssh 0.1.9
  * vagrant-reload 0.0.1
  * vagrant-vbguest 0.32.0


The `Vagrantfile` provides 3 vCPUs and 4096 MB of RAM to the VM, you can set those parameters to more appropiate values there, changing the lines:

```ruby
VM_NUM_CPUS=3
VM_RAM="4096"
```

