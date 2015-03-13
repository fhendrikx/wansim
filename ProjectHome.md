## Introduction ##

WANsim allows you to emulate a WAN connection. In particular, it allows a user to change the emulated WAN speed, latency, variation, packet loss, packet duplication and packet corruption aspects. WANsim is usually configured as a network bridge that is established between two NICs at boot time.

WANsim utilises the **Linux Kernel NETEM functionality** to accomplish its goals. Although relatively well documented, this functionality is not the easiest to use. WANsim wraps this into a simple to use script that can be accessed by simply logging into the Linux host using the `wansim` user account (see ScreenShot).

WANsim was originally written for my own needs. It is provided to you in the hope that it might be useful. **Feel free to drop me a line if you have any suggestions, problems or patches.**

Cheers, Ferry Hendrikx<br>
Wellington, New Zealand<br>
<br>
<br>
<h3>Information</h3>

Please see the following pages for further information.<br>
<br>
<ul><li>InstallRequirements<br>
</li><li>InstallSteps<br>
</li><li>FrequentlyAskedQuestions<br>
</li><li><a href='https://drive.google.com/folderview?id=0BwWed_SK4lm9M3pOamprYWY5MWc&usp=sharing'>Downloads</a></li></ul>
