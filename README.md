# My Shellscritps

Collection of script that I use to help my laziness to take my hand off the keyboard.

## Configure

### Install

Justt copy and paste this command:
```sh
sudo bash -c  "$(wget -qO- https://git.io/JqrsA)"
```
and press ENTER.

Enter a directory for installing the scripts or use the ```-d``` option for the standard installation (```/opt/ShellScripts```).

### Maual install

I place these scripts inside ```/opt/Shellscripts``` and export to $PATH.

```bash
export PATH=/opt/ShellScripts/:$PATH
```

I use the keyboard shortcut configuration to call some scripts, and if necessary I can call them directly from the terminal.

## Excute

To run any script, after exporting the folder in ~ / .bashrc:

```bash
./color.sh
```

## Scripts inside
What's in the project is and what it does.

##### $ bluefilter.sh
Decreases the color temperature.

#### $ color.sh
Show the color values accepted by the ASCII code

#### $ mic_stats.sh
Check whether the microphone is muted or not.

#### $ mictest.sh
Loopback to output the input audio.

#### $ mic_toggle.sh
Mute and unmute microphone.
