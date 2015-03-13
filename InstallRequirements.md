# Requirements #

WANsim was originally written for [Ubuntu](http://www.ubuntu.com) Linux. However, it is now maintained on Debian 7. Some of the documentation on this site assumes that you are using a Debian/Ubuntu Linux install.

However, WANsim should work correctly on any Linux server if you have some basic knowledge of Unix/Linux administration. Recent changes to the wansim init.d script have made it more resilient on non-Debian platforms.

WANsim requires the following:

  * Standard PC or server with at least 2 NICs (network cards) for bridged mode (however it will work with only one NIC in router mode)
  * Linux installed (with a recent Linux kernel)

The following packages are required:

  * bash
  * bridge-utils
  * iproute
  * net-tools

The following packages are optional (but useful):

  * sudoers