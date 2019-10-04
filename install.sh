#!/bin/bash

 # Arissploit Framework - database of exploits, viruses, etc.
 # Copyright (C) 2019 Arissploit Team
 #

 # Modified BSD License
 #
 #        Redistribution and use in source and binary
 # forms, with or without modification, are permitted
 # provided that the following conditions are met:
 #
 # 1. Redistributions of source code must retain the
 #    above copyright notice, this list of conditions
 #    and the following disclaimer.
 # 2. Redistributions in binary form must reproduce the
 #    above copyright notice, this list of conditions
 #    and the following disclaimer in the documentation
 #    and/or other materials provided with the
 #    distribution.
 # 3. The name of the author may not be used to endorse
 #    or promote products derived from this software
 #    without specific prior written permission.
 #
 # THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS''
 # AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
 # BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 # ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
 # LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 # NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 # SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 # INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 # LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 # TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 # ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

CE="\033[0m"
RS="\033[1;31m"
YS="\033[1;33m"
NV="\033[1;37m"

WHO="$( whoami )"

if [[ "$WHO" != "root" ]]
then
sleep 1
echo -e "$RS"run it as"$CE" "$YS"root"$CE"
sleep 1
echo -e "$RS"or use"$CE" "$YS"sudo"$CE"
sleep 1
exit
fi

cd ~ 
if [[ -d arissploit ]]
then
clear
cd arissploit
else
{
git clone https://github.com/entynetproject/arissploit.git
} &> /dev/null
cd arissploit 
chmod +x install.sh
fi

printf '\033]2;Arissploit INSTALLER\a'
clear
cat ~/arissploit/banner/banner1.txt
echo -e "\033[1;33mBy Arissploit Team\033[0m"
sleep 3
echo -e "More on our site:"
sleep 3
echo -e "==> \033[1;33mhttp://entynetproject.simplesite.com/\033[0m"
sleep 3
echo -e "Creators of Arissploit Framework (\033[4;33marissploit team\033[0m):"
sleep 3
echo -e "\033[4;34mEntynetproject\033[0m - Main Developer"
sleep 3
echo -e "\033[4;33mDJ Mobley\033[0m      - Ascii Designer"
sleep 3
echo -e "Press \033[1;33many key\033[0m to install arissploit"
read -n 1

clear
{
cp bin/arissploit /bin
chmod +x /bin/arissploit
cp bin/arissploit /usr/local/bin
chmod +x /usr/local/bin/arissploit
} &> /dev/null

sleep 1
echo -e "Select your architecture ("$YS"amd"$CE"/"$YS"intel"$CE"/"$YS"arm"$CE")."
echo -e "Arissploit supports "$YS"amd"$CE", "$YS"intel"$CE" and "$YS"arm"$CE" architectures."
echo -e "Select your architecture to install compatible dependencies."
read -p $'(\033[4;93march\033[0m)> ' CONF

if [[ "$CONF" = "amd" ]]
then
sleep 1
clear
cd install
sleep 1
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
pip install -r requirements.txt
else
apt-get update
apt-get install python
apt-get install git
apt-get install wget
apt-get install python2-pip
apt-get install perl
apt-get install Build essential
apt-get install libany-uri-escape-perl
apt-get install libhtml-html5-entities-perl
apt-get install libhtml-entities-numbered-perl
apt-get install libhtml-parser-perl
apt-get install libwww-perl
apt-get install php
sleep 0.5
pip install -r requirements.txt
fi
fi

if [[ "$CONF" = "arm" ]]
then
sleep 1
clear
cd install
sleep 1
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
pip install -r requirements.txt
else
pkg update
pkg install git
pkg install wget
pkg install python
pkg install python2
pkg install perl
pkg install php
sleep 0.5
pip install -r requirements.txt
fi
fi

if [[ "$CONF" = "intel" ]]
then
sleep 1
clear
cd install
sleep 1
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
pip install -r requirements.txt
else
apt-get update
apt-get install python
apt-get install git
apt-get install wget
apt-get install python2-pip
apt-get install perl
apt-get install Build essential
apt-get install libany-uri-escape-perl
apt-get install libhtml-html5-entities-perl
apt-get install libhtml-entities-numbered-perl
apt-get install libhtml-parser-perl
apt-get install libwww-perl
apt-get install php
sleep 0.5
pip install -r requirements.txt
fi
fi

clear

printf '\033]2;Arissploit INSTALLER\a'
sleep 3
echo -e "Open a NEW terminal and type '"$YS"arissploit"$CE"' to launch the framework"
sleep 2
