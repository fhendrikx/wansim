# News #

**Nov 15th 2014**

WANsim Release 2.1.1-1 is out.

This release fixes an issue where a zero variance was causing the NETEM options to be incorrectly created and applied.


**Nov 12th 2014**

WANsim Release 2.1.0-1 is out.

This release fixes a number of issues, including the burst size calculation, handling of floats, and slight changes to the handling of the NETEM options during interface stand-up.

If you are having issues with getting the performance you expected, please consider creating the /var/lib/wansim/interfaces.conf file and setting the IFxGRO option to "Off". A template version of the configuration file is provided in that same directory that you can copy. This issue has been seen on Intel e1000e NICs but may affect others.


**Feb 11th 2013**

WANsim Release 2.0.1-1 is out.

This release is just a minor fix to some util paths in the init.d script that have changed from /usr/sbin to /sbin. Thanks to Tino Svatek for pointing it out.


**May 31th 2011**

WANsim Release 2.0.0-1 is out.

This release includes:
  * Bridge and Router modes
  * Re-worked qdisc setting code
  * Correlation settings in the menu


**May 26th 2011**

I have received some patches that have spurred me to release the major update mentioned below. In particular, netem qdiscs are not allowed to have child qdiscs anymore, so the approach in the init file has changed. Watch this space.


**Nov 10th 2009**

Started work on the next major revision of WANsim. This version will include both "bridge" and "router" support and is intended to work with a wider range of Linux distributions.


**Nov  3rd 2009**

WANsim Release 1.6-1 is out.

This release includes:
  * Added author and licensing information
  * Added man pages
  * Fixed tab error in install script


**Mar  3rd 2009**

WANsim Release 1.5-1 is out.

This release includes:
  * Settings are now applied equally to all interfaces
  * Added Bridge Mask setting
  * Fixed sudoers file tab issue

See the FrequentlyAskedQuestions page for more information.


**Feb 14th 2009**

WANsim Release 1.4-1 is out.

This release includes some major changes:
  * Changed init.d script to be more tolerant of non LSB systems
  * Fixed LSB INIT INFO in init.d script
  * Added chkconfig configuration line to init.d script for RH systems
  * Configuration file interfaces.conf loaded and used _only_ if it exists
  * Additional error checking in wansimsetup
  * Added install script for non-Debian users (experimental - use with care)


**Dec 16th 2008**

Work has started on the next release of WANsim. Expect the release to be ready early next year. My ToDo list has further information.


**Oct 30th 2008**

WANsim Release 1.3-2 is out.

This release includes some minor changes:
  * Fixed a bug (relating to the user-supplied patch)
  * Added missing variable in default configuration file


**Oct 29th 2008**

WANsim Release 1.3-1 is out.

This release includes a patch from Philippe Lombard and some minor fixes.
  * Configure a gateway
  * Minor change to init.d script
  * White space changes


**Sep 29th 2008**

WANsim Release 1.1-3 is out.

This is the first real release of WANsim. Your feedback is welcome.