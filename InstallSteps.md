# Installation #

WANsim can be installed either automatically or manually.


## Automatic installation ##

Use this installation method if you are using Ubuntu or Debian Linux. You will need to download the WANsim debian package.

**Step 1: Install the debian package**

`dpkg -i wansim.deb`

**Step 2: Set the password for the wansim user**

`passwd wansim`

**Step 3: Login as wansim**

You can login as `wansim` via either:
  * Console
  * SSH to the host


## Manual installation ##

This installation method should work for any Linux variant. You will need to download the WANsim source code.

**Step 1: Unpack the source code**

`tar zxf WANsim.tar.gz`

Note: _At this point, you could try the new install.sh script. This duplicates most of the steps below (which originally came from the Debian package scripts I wrote). However, please use this with care as it makes some assumptions about your system._

**Step 2: Add WANsim user**

`adduser --system --group --shell /usr/sbin/wansimsetup --home /var/lib/wansim wansim`

`passwd wansim`

If you have sudoers installed, this line allows the WANsim script to start/stop the WANsim init.d script:

`echo "wansim ALL=NOPASSWD: /usr/sbin/invoke-rc.d" >> /etc/sudoers`

Note: that _service_ can be used to accomplish the same goals on different systems.


**Step 3: Add WANsim init.d task**

`cp wansim /etc/init.d`

The following line assumes you are using Ubuntu or Debian:

`update-rc.d wansim start 10 2 3 4 5 . stop 60 0`

Note: _ntsysv_ and _chkconfig_ can be used to accomplish the same goals on different systems.


**Step 4: Add WANsim setup script**

`cp wansimsetup /usr/sbin/`


**Step 5: Add WANsim default configuration**

`cp wansim.conf.sample /var/lib/wansim/wansim.conf`

`cp interfaces.conf.sample /var/lib/wansim/interfaces.conf`


**Step 6: Login as wansim**

You can login as `wansim` via either:
  * Console
  * SSH to the host