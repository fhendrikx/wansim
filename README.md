Introduction
WANsim allows you to emulate a WAN connection. In particular, it allows a user to change the emulated WAN speed, latency, variation, packet loss, packet duplication and packet corruption aspects. WANsim is usually configured as a network bridge that is established between two NICs at boot time.

WANsim utilises the Linux Kernel NETEM functionality to accomplish its goals. Although relatively well documented, this functionality is not the easiest to use. WANsim wraps this into a simple to use script that can be accessed by simply logging into the Linux host using the wansim user account (see ScreenShot).

WANsim was originally written for my own needs. It is provided to you in the hope that it might be useful. Feel free to drop me a line if you have any suggestions, problems or patches.


Requirements
WANsim was originally written for Ubuntu Linux. However, it is now maintained on Debian 7. Some of the documentation on this site assumes that you are using a Debian/Ubuntu Linux install.

However, WANsim should work correctly on any Linux server if you have some basic knowledge of Unix/Linux administration. Recent changes to the wansim init.d script have made it more resilient on non-Debian platforms.

WANsim requires the following:

Standard PC or server with at least 2 NICs (network cards) for bridged mode (however it will work with only one NIC in router mode)
Linux installed (with a recent Linux kernel)

The following packages are required:
bash
bridge-utils
iproute
net-tools

The following packages are optional (but useful):
sudoers


