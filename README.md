# Quick-Nmap-Scan

Performs scan of all TCP ports using -T4 switch and puts those open ports into a -sC -sV nmap scan to attempt to increase scan speeds. The scan will also produce output files in all formats and save them to directory specified by user.

Takes two arguments: IP address to scan & Directory to save output files

Usage: ./quick-scan 10.11.0.3 /root/machineName
