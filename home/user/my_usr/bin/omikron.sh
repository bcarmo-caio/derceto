#!/bin/bash -e
#não preciso do 'env bla bla bla'. env cria um novo ambiente,
#	mas esse script ja faz isso na primeira linha!!
echo "lançando omikron"
echo -ne "\tmudando diretório  '/home/user/.wine-1.3.2_compilado/drive_c/GOG\ Games/Omikron\ \-\ The\ Nomad\ Soul/' "
cd  /home/user/.wine-1.3.2_compilado/drive_c/GOG\ Games/Omikron\ \-\ The\ Nomad\ Soul/ && echo "OK. Carregando..."
WINEPREFIX=/home/user/.wine-1.3.2_compilado
optirun /home/user/my_usr/wine-1.3.2/bin/wine Runtime

echo
echo "Finalizando jogatina omikron"
echo -ne "\tvoltando ao diretório antigo: "
cd -
echo "Pronto."
unset WINEPREFIX

xrandr -s 1366x768

exit 0
