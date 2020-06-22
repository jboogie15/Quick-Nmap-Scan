#!/bin/bash
# 
# --------------------------------------------------------
# Script that scans all ports and runs open ports
# into default scripts to create a faster nmap scan.
# Nmap will produce output files of formats in directory
# specified by end user. 
#---------------------------------------------------------

# Command Line Arguments Error Message
if [ "$2" == "" ]
then
	echo "[-] Usage: ./quick-scan.sh <IP Address> <Directory To Save Files>"
	echo "[-] Example: ./quick-scan.sh 10.10.10.10 /root/machine"

else
# Running nmap scan of all TCP Ports
	echo "[*] Performing all ports scan on $1 . . ."
	nmap -T4 -p- $1 > $2/open.txt
	
# Creating Open-Port.txt document with all found open ports
	cat $2/open.txt | grep open | cut -f 1 -d / | sed 's/.*/&/;$!s/$/,/' | tr -d '\n' > $2/open-port.txt
	rm $2/open.txt

# Run more detailed nmap scan on those open ports
	echo "[*] Found open ports: $(cat $2/open-port.txt)"
	echo "[*] Nmap output files will be saved at $2/nmap-scans/"

# Organize output files
	mkdir $2/nmap-scans

# Run script detailed scan on open ports found
	for port in $(cat $2/open-port.txt); do
	nmap -T4 -sC -sV -p $port $1 -oA $2/nmap-scans/nmap; done

# Clean up of open-port.txt
	rm $2/open-port.txt
fi

