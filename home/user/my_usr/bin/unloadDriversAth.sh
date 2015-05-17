#!/bin/bash

modprobe -r ath9k_htc; modprobe -r ath9k; modprobe -r ath ; lsmod | grep ath

#rm -f /etc/modprobe.d/ath.conf
#echo "blacklist ath9k_htc" >> /etc/modprobe.d/ath.conf
#echo "blacklist ath9k" >> /etc/modprobe.d/ath.conf
#echo "blacklist ath" >> /etc/modprobe.d/ath.conf
#https://wiki.debian.org/KernelModuleBlacklisting
#depmod -ae
#update-initramfs -u

#tendo que ser mais drastico que a solucao acima...
rfkill list
#rfkill list | egrep '^[0-9]*:'
echo "Wich one do you want to soft block?"

read dev


if [ $dev -eq 0 ]; then
	echo "I don't think it's a good idea to disable 0. Are you sure?"
	opt=0
	while [[ $opt != "y" ]]; do
		echo -n "(y/ctrl + c): "
		read opt
	done
fi

#arrumar daqui pra baixo
#rfkill block $dev
echo "nao foi bloqueado pq isso trava a net toda.. tem algo errado aqui ainda"
rfkill list

exit 0


