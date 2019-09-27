# Configuring HA and Motion with Salt

This project is used as a demonstration showing how to configure a 2 raspberries [HA cluster](https://clusterlabs.org/).
The cluster will manage [motion](https://motion-project.github.io/) that is a software that provides
the option to serve webcam images over a http. In this case, when motion fails in one node, the
deamon will be started in the second, making the service high available.

## Project structure

- [setup](./salt/setup): Salt states to configure the current machine as a salt master.
- [minion_configuration](./salt/minion_configuration): Salt states used to preconfigure the raspberry
nodes to enable HA and motion usage.
- [cluster_configuration](./salt/cluster_configuration): Salt states to install motion and HA cluster. HA is installed using [habootstrap-formula](https://github.com/SUSE/habootstrap-formula)

## How to use

First of all, the next files must be updated with the IP addresses of the Raspberries. These files are used to know the addresses by salt during the execution.

- [minion_configuration](./salt/minion_configuration/pillar/minion_configuration.sls)
- [roster](./salt/minion_configuration/roster)

Besides that, the pillar files in [pillar](./salt/cluster_configuration/pillar) can be update if the cluster needs some customization.

To use the project just run [run.sh](./run.sh) with admin rights or the commands in that file in
sequence to follow better the execution.

**INFO**: The raspberries must be already connected to some network with internet connection.

**Tested with**: Raspberry pi 3 and [openSUSE Leap 15.1](http://ftp.rnl.tecnico.ulisboa.pt/pub/opensuse/ports/aarch64/distribution/leap/15.1/appliances/openSUSE-Leap-15.1-ARM-JeOS-raspberrypi3.aarch64-2019.05.17-Snapshot1.41.raw.xz).

## Disclaimer
The project doesn't have any real use case, it's just create to show how HA works.
