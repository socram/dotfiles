#!/bin/bash

# cat -n /tmp/jjClipboardManager.history | tac | tr -d ' ' | grep -m2 '_#_' | cut -d '	' -f1 > /tmp/abc ; ini=`cat /tmp/abc | tail -1`; end=`cat /tmp/abc | head -1` ; ini=$((ini-1)); end=$((end-1)); echo 'sed -n '${ini}','${end}'p' /tmp/jjClipboardManager.history | sh | grep -v '_#_' | grep . > /tmp/lastPaste

function my_clipboard()
{
  cat -n /tmp/jjClipboardManager.history | tac | tr -d ' ' | grep -m2 '_#_' | cut -d '	' -f1 > /tmp/abc ;
  ini=`cat /tmp/abc | tail -1`;
  end=`cat /tmp/abc | head -1` ;
  ini=$((ini-1));
  end=$((end-1));
  echo 'sed -n '${ini}','${end}'p' /tmp/jjClipboardManager.history | sh | grep -v '_#_' | grep . > /tmp/lastPaste

 if [ -f "/tmp/lastPaste" ];
 then
    tail -1 /tmp/lastPaste |sed 's/"//g' | cut -c 1-20
 else
  echo 'nada no clipboard'
 fi

}

function vpnConnection()
{
  local running=`ps -ef | grep -i vpn | grep LEADCOMM_SP_Remote_Access_mconceicao.p12 | wc -l `

  echo $running >> /tmp/saida.txt
  if [ $running  = '1' ]
  then
    echo '  - '$(ip r | grep tun0 | grep src | grep --color -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep -Ev '0$')
  else
    echo '  Leadcomm -VPN - Disconnected'
  fi
}


echo '{ "version": 1 , "click_events":true}'

echo '['

echo '[]'

(while :;
do
  echo ',['

  echo ' {"background": "#ff5555","name":"data","full_text":"  '$(date)'"}'
  echo ',{"background": "#e5c07b","name":"clipboard","full_text":"ClipBoard''"}'
  echo ',{"background": "#FFFFFF","name":"windows52","full_text":"'VM .52'"}'
  echo ',{"background": "#56b6c2","name":"vpn","full_text":"'$(vpnConnection)'"}'
  echo ',{"background": "#50fa7b","name":"rede","full_text":" '$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p') ' - '$(ip route get 1 | sed -n "s/.*src \([0-9.]\+\).*/\1/p")'"}'
  echo ',{"background": "#f1fa8c","name":"bateria","full_text":" '$(cat /sys/class/power_supply/BAT0/status) '-' $(cat /sys/class/power_supply/BAT0/capacity)%'"}'
  echo ',{"background": "#bd93f9","name":"cpu","full_text":" '$(LC_NUMERIC=en_US.UTF-8 top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')'"}'
  echo ',{"background": "#ff79c6","name":"memoria","full_text":" '$(free -g | awk '/^Mem/ {print $3}')''/''$(free -g | awk '/^Mem/ {print $2}' )'"}'
  echo ',{"background": "#8be9fd","name":"volume","full_text":"'$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))'"  }'

  # echo ',{"background": "#8be9fd","name":"mais","full_text":" "  }'
  # echo ',{"background": "#8be9fd","name":"menos","full_text":" "   }'
  # echo ',{"background": "#8be9fd","name":"mudo","full_text":" "  }'
  # echo ',{"background": "#e5c07b","name":"3","full_text":" '$(my_clipboard)'"}'
#
  echo ']'

  sleep 2
done) &


while read line;
do
  name=`echo $line | sed 's/^,//g ' | jq .name | sed 's/"//g'`


  case $name in
      clipboard )
      cat /tmp/jjClipboardManager.history > /tmp/1.txt
      gnome-terminal -e 'gedit /tmp/1.txt' & ;;

      volume    ) gnome-control-center -s "Sound"   & ;;
      rede      )
            echo "Ak2539yz" | xsel --clipboard --input 
           gnome-terminal -e 'nmtui' & ;;

      windows52 )

        isRunning=$(ps -ef | grep rdesktop | wc -l)

        echo $isRunning >> /tmp/marcos

        if [ "$isRunning" -gt "1" ]
        then
          ps -ef | grep rdesktop | awk '{ print $2 }' | xargs kill -9
        else
          gnome-terminal -e 'bash /home/mconceicao/.win.52.sh &'
        fi
      ;;
  esac

done
