Step 1: Install ahkscript.org  
Step 2: ???  
Step 3: Profit

For best results, rename file to svchost.ahk and compile to .exe, then run directly on victim's computer from thumb drive. Or, put it in their startup folder if you think they won't notice.

MouseJump is set to randomly move the victim's mouse every 5 minutes, within a range of -500 to +500 pixels in both axes. Tune parameters to your preferences, or randomize the time delay, a la [Annoy-a-tron](http://www.thinkgeek.com/product/b278/).

InvertLockScreen disables locking the computer through Ctrl-Alt-Del and hijacks the Win-L shortcut to turn the screen upside-down as it locks. Rotates the screen back to normal upon successful login. Tested on Windows 7, as it stands it requires a graphics driver with rotation hotkeys set to Ctrl-Alt-arrows. Careful, if you kill it the mean way through Task Manager, it won't re-enable locking. Depending on the speed of the computer you may need to increase the delay between flipping and locking the screen, otherwise it won't flip and the mouse will bug out when it unlocks.

Exit either script the nice way with Ctrl-Alt-Shift-Z.

More inspiration [here](http://www.howtogeek.com/57552/the-10-most-ridiculously-awesome-geeky-computer-pranks/).
