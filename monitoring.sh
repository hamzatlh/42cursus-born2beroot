#!/bin/bash
total=$(df -Bg | grep LVM | awk '{f += $2} END {print f}')
used=$(df -Bm | grep LVM | awk '{f += $3} END {print f}')
porcentage=$(df -Bm | grep LVM | awk ' END {printf("(%d%%)\n"), $3/$2*100}')
IP=$(hostname -I)
link=$(ip link show | grep 'link/ether' | awk ' {print $2}')
lvm="$(lsblk | awk 'NR==7'| awk '{print$6}')"
lvmu=$(if [[ $lvm = lvm ]]; then echo yes; else echo no; fi)
CMD=$(journalctl _COMM=sudo -q | grep COMMAND | wc -l)
wall "
	#Architecture: $(uname --all)
	#CPU physical: $(lscpu | egrep 'CPU\(s\)' | awk 'NR==1{print $2}')
	#vCPU: $(grep "^processor" /proc/cpuinfo | wc -l)
	#Memory Usage: $(free -m | grep Mem | awk '{printf("%d/%dMB (%.2f%%)\n"), $3,$2, $3/$2*100}')
	#Disk Usage: $used/${total}Gb $porcentage
	#CPU load: $(top -bn1 | grep '^%Cpu' | awk -F , '{print $4}' | awk '{print $1}' | awk '{printf("%.1f%%\n"), 100-$1}')
	#Last boot: $(who -b | awk '{print $3,$4}')
	#LVM use : $lvmu
	#Connection TCP : $( ss -t | grep 'ESTAB' | wc -l) ESTABLISHED
	#User log: $(who | wc -l)
	#Network: IP $IP ($link)
	#sudo : $CMD cmd"
