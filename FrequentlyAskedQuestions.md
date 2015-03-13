﻿#labels Phase-Deploy
# FAQ #

## General ##

**Why did you call it WANsim?**

I wanted a simple, easy to remember name. Obviously it needed to feature the word **WAN**. Simulation came about because I was simulating a real WAN. Of course, the term I should really have used is _emulation_.

Unfortunately, it's a little late to change it now.   :)


**What's the deal with certain settings being doubled?**

In bridging mode, all of the settings in WANsim are applied to both interfaces. Some of these parameters may have a culmulative effect, meaning that it is added once for each interface. For example, if you set a latency of 15ms in the WANsim interface, your actual latency will be 30ms (15ms for interface 0 + 15ms for interface 1).

The affected settings are clearly indicated in the WANsim interface.

Affected settings:
  * Latency and variation
  * Packet loss
  * Packet corruption
  * Packet duplication
  * Packet re-ordering


**What do the Packet loss, corruption and duplication values actually mean?**

These values control the percentage of packets that are dropped, corrupted or duplicated respectively. For example, setting 1% packet loss would cause 1 in 100 packets to be dropped. Similarly, setting 0.1% packet loss would cause 1 in 1000 packets to be dropped. The smallest value possible is 0.0000000232% (which is 2<sup>32</sup>).


**Is packet re-ordering supported?**

Yes, you can set packet re-ordering in the WANsim interface. However, re-ordering also requires that you set some latency and variation.


**Does the menu still fit into an 80x25 console?**

I originally tried to keep WANsimsetup within the 80x25 boundaries, however there simply wasn't room.


## Software ##

**Why write the whole thing as a bash script?**

Why not? I could have used Perl, but bash is more widely available, especially on small systems with limited resources (think something like a Soekris Net4501) or embedded systems.


**What kernel do I need?**

You need a relatively recent Linux kernel. Any 2.6+ Linux kernel should do the trick.


**What modules do I need to enable/compile in my kernel?**

You will need:
  * 802.1d Ethernet Bridging module
  * Network Emulation module (it's under QoS/Fair Queuing)


**Do I need to configure my interfaces?**

No, WANsim will take care of configuring your interfaces and the bridge. If your interfaces require special modules to be loaded, you will still need to ensure that these are loaded.


**Do I really need sudoers installed?**

Strictly speaking you don't actually need sudoers to be installed. However, the WANsim interface offers an option that allows you to restart the WANsim init.d script. For this to work, you need to be able to run init.d scripts. This can be done via either sudoers (my preferred option) or changing the permissions bits on the script (a potential security hole).


**What's the default password for the wansim user?**

There isn't one. You need to set the password for the wansim user after you've installed the package. Use the UNIX _passwd_ command to do that.


**Why doesn't the change I made in the WANsim interface take immediate effect?**

The intention with the interface was that changes are not saved until you explicitly save them. As a direct result of that design decision, your changes don't take effect until you've saved your changes and either restarted WANsim or rebooted the host.


## Hardware ##

**What network cards can I use with WANsim?**

You should be able to use any standard network card that can be put into _promiscuous mode_. This will unfortunately rule out many wireless network cards as they don't interact nicely with the kernel bridging code (it requires promiscuous mode). Recently, it was noted that some Intel e1000e NICs have issues under Debian 7. This can be resolved by setting GRO off in the interfaces.conf file (see the next point for how to set this up).


**How do I set my interfaces to 10/100/1000, Half/Full Duplex, GRO, etc?**

Copy the file /var/lib/wansim/interfaces.conf.sample to just interfaces.conf. Edit the file to suit your needs. On WANsim restart, it will detect the file and apply the settings. Deleting this file ensures that the settings are no longer applied.


**What is the maximum emulated network speed you can achieve?**

On a low end Pentium IV I was able to achieve a 15Mbit throughput. I'm certain you'll get better results on more powerful hardware. I have informal reports of much greater throughput on new hardware. Your milage may vary.