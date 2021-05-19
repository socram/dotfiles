#!/bin/bash

function vpnConnection()
{
  local running=`ps -ef | grep -i vpn | grep LEADCOMM_SP_Remote_Access_mconceicao.p12 | wc -l `

  echo $running >> /tmp/saida.txt
  if [ $running  = '1' ]
  then
    echo '  - '$(ip r | grep tun0 | grep src | grep --color -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep -Ev '0$')
  else
    echo '  Leadcomm - VPN - Disconnected'
  fi
}


echo '{ "version": 1 , "click_events":true}'

echo '['

echo '[]'

(while :;
do
  echo ',['

  echo ' {"background": "#ABB2BF" , "name":"data","full_text":"  '$(date)'"}'
  echo ',{"background": "#ABB2BF" , "name":"clipboard","full_text":"ClipBoard''"}'
  echo ',{"background": "#ABB2BF" , "name":"vpn","full_text":"'$(vpnConnection)'"}'
  echo ',{"background": "#ABB2BF" , "name":"rede","full_text":" '$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p') ' - '$(ip route get 1 | sed -n "s/.*src \([0-9.]\+\).*/\1/p")'"}'
  echo ',{"background": "#ABB2BF" , "name":"bateria","full_text":" '$(cat /sys/class/power_supply/BAT0/status) '-' $(cat /sys/class/power_supply/BAT0/capacity)%'"}'
  echo ',{"background": "#ABB2BF" , "name":"cpu","full_text":" '$(LC_NUMERIC=en_US.UTF-8 top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')'"}'
  echo ',{"background": "#ABB2BF" , "name":"memoria","full_text":" '$(free -g | awk '/^Mem/ {print $3}')''/''$(free -g | awk '/^Mem/ {print $2}' )'"}'
  echo ',{"background": "#ABB2BF" , "name":"volume","full_text":"'$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))'"  }'

  echo ']'

  sleep 2
done) &


while read line;
do
  name=`echo $line | sed 's/^,//g ' | jq .name | sed 's/"//g'`

  case $name in
      clipboard )
      tac /tmp/jjClipboardManager.history.txt > /tmp/1.txt
      brave-browser --newtab "file:////tmp/1.txt"  ;;


      volume    ) gnome-control-center -s "Sound"   & ;;
      rede      )
            echo "Ak2539yz" | xsel --clipboard --input 
           gnome-terminal -e 'nmtui' & ;;
  esac
done
