# ------- JJ BashRC
# Chromebook
#sudo mount -i -o remount,exec /home/chronos/user

shopt -s histappend # Do not overwrite history
shopt -s expand_aliases # Expand aliases
shopt -s checkwinsize # Checks term size when bash regains control 



# Load
# {{{
  setxkbmap -model pc105 -layout us_intl              # Configura Modelo do Teclado
  # Inicia sessão Tmux

  if [[ -z "$TMUX" ]]; then
    if tmux has-session 2>/dev/null; then
        exec tmux a -t main
    else
        exec tmux -2 new -s main
    fi
fi


  export EDITOR=vi
  bind 'set show-mode-in-prompt on' # Mostra em qual tipo de terminal eu estou, cmd ou ins
  set -o vi
  alias T='xmodmap /home/mconceicao/.Xmodmap'

  # Desliga Caps_Lock
  setxkbmap -option ctrl:nocaps
# }}}

# Functions # {{{
    function jj()
    {
        grep function ~/.bashrc | sed 's/function//g ; s/()//g ' | tr -d ' ' | grep -vE 'grep|jj$'
    }

    function jjClipboardManager()
    {
    while true
    do
      NEW='/tmp/jjClipboardManager.new'
      OLD='/tmp/jjClipboardManager.old'
      HISTORY='/tmp/jjClipboardManager.history'

      xsel --clipboard --output | md5sum > ${NEW}
      cmp -s ${NEW} ${OLD}
      
      if [ "$?" != "0" ]
      then
        # echo 'diferentes'
        cat ${NEW} > ${OLD}
        xsel --clipboard --output >> ${HISTORY}
        echo -ne '\n--\n' >> ${HISTORY}
      fi
      sleep 1s;
    done
    }
    
    running=$(ps -ef | grep [j]jClipboardManager | wc -l )

   if [ "$running" -eq "0" ]
   then
    export -f jjClipboardManager
    nohup bash -c jjClipboardManager 1> /dev/null 2>&1 &
   fi
    


    function jjBackUp()
    {
        cp -vi "${1}" "${1}.bkp.$(date +%Y%m%d-%s)"
    }

    function jjCreateRandomPassword ()
    {
      </dev/urandom tr -dc '1234567890!@#$%^&()_+ABCDEFGHIJLMNOPQRSTUVXZabcdefghijlmnopqrstuvxz' | head -c $1; echo ""
    }

    function jjExtract ()
    {
      if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xjf    ${1} ;;
          *.tar.gz)  tar xzf    ${1} ;;
          *.bz2)     bunzip2    ${1} ;;
          *.rar)     rar x      ${1} ;;
          *.gz)      gunzip     ${1} ;;
          *.tar)     tar xf     ${1} ;;
          *.tbz2)    tar xjf    ${1} ;;
          *.tgz)     tar xzf    ${1} ;;
          *.zip)     unzip      ${1} ;;
          *.Z)       uncompress ${1} ;;
          *.7z)      7z x       ${1} ;;
          *)         echo 			${1} cannot be extracted ;;
        esac
      else
        echo ${1} is not a valid file
      fi
    }

    function jjFlagsTcpDump ()
    {
      echo -e "
      +----------------------------------------------------------------------------------------------------------------------------------------------+
      |   TCP Flag        |       Flag tcpdump    |                                       Significado                                            |
        +----------------------------------------------------------------------------------------------------------------------------------------------+
      |   SYN             |       s               |       Syn packet, a session establishment request.  A primeira parte de qualquer conexão TCP.|
        |   ACK             |       ack             |       Ack packet, usado para reconhecimento de dados do sender.Pode aparecer em conjunto.    |
        |   FIN             |       f               |       Finish flag, usado para indicar a intencao do sender de encerrar a conexao.            |
        |   RESET           |       r               |       Indica a intencao do remetente de abortar imediatamente a conexao existente.           |
        |   PUSH            |       p               |       Sinaliza o envio imediato de dados do host de envio para o host receptor.              |
        |   URGENT          |       urg             |       Dados urgentes devem ter precedência sobre outros dados. Por exemplo, um Ctrl-C.       |
        |   Placeholder     |       .               |       Se a conexao nao tiver finish, reset, ou push flag setado.                             |
        +----------------------------------------------------------------------------------------------------------------------------------------------+
      "
    }

    function jjKill ()
    {
      kill -9 $(ps -ef | grep $1 | awk '{print $2} ')
    }

    function jjLocalServer ()
    {
      python -m SimpleHTTPServer 8000
    }

    function jjMkdir()
    {
    if [ "$#" -ne 1 ]
    then
      echo -e "How to use:\n\t jjMkdir <folder|/path/to/folder/folder-name>"
      exit;
    fi
        mkdir -p ${1} ; cd ${1} ; pwd
    }

    function jjMyIpAdress ()
    {
      echo -e '\nLocal\n'
      ip addr sh | grep -vE inet6 | grep -E inet | grep -E "10|192|172" | awk ' { print "interface > "  $NF " IP > " $2} '
      echo -e '\nPublic\n'
      curl -s ipinfo.io/ip
      echo ''
    }

    function jjNetwork ()
    {
      echo -e "

      \033[01;32mMáscaras de Subrede para Classe A \033[01;37m
      \033[01;31mClasse A – Padrão 255.0.0.0 com perfixo /8\033[01;37m
      \033[1;33mQnt Bits        Máscara             Prefixo     Subredes  (2^n)  Qnt Hosts ((2^n)-2)\033[0m
      01 	 	255.128.0.0 	 	/09             2 	 	        8388606
      02 	 	225.192.0.0 	 	/10             4 	 	        4194302
      03 	 	225.224.0.0 	 	/11             8 	 	        2097150
      04 	 	225.240.0.0 	 	/12             16 	 	        1048574
      05 	 	225.248.0.0 	 	/13             32 	 	        524286
      06 	 	225.252.0.0 	 	/14             64 	 	        262142
      07 	 	225.254.0.0 	 	/15             128 	        131070
      08 	 	255.255.0.0 	 	/16             256  	        65534
      09 	 	255.255.128.0 	 	/17             512 	        32766
      10 	 	255.255.192.0 	 	/18             1024 	        16382
      11 	 	255.255.224.0 	 	/19             2048 	        8190
      12 	 	255.255.240.0 	 	/20             4096 	        4094
      13 	 	255.255.248.0 	 	/21             8192 	        2046
      14 	 	255.255.252.0 	 	/22             16384 	        1022
      15 	 	255.255.254.0 	 	/23             32768 	        510
      16 	 	255.255.255.0 	 	/24             65536 	        254
      17 	 	255.255.255.128     /25             131072 	        126
      18 	 	255.255.255.192     /26             262144 	        62
      19 	 	255.255.255.224     /27             524288 	        30
      20 	 	255.255.255.240     /28             1048576          14
      21 	 	255.255.255.248     /29             2097152          6
      22 	 	255.255.255.252     /30             4194304          2
      23 	 	255.255.255.254     /31             8388608          2 (*)

      \033[01;32mMáscaras de Subrede para Classe B\033[01;37m
      \033[01;31mClasse B – Padrão 255.255.0.0 com perfixo /16\033[01;37m
      \033[1;33mQnt Bits        Máscara             Prefixo     Subredes  (2^n)  Qnt Hosts ((2^n)-2)\033[0m
      01 	 	255.255.128.0 	 	/17             2 	 	         	32766
      02 	 	255.255.192.0 	 	/18             4 	 	         	16382
      03 	 	255.255.224.0 	 	/19             8 	 	         	8190
      04 	 	255.255.240.0 	 	/20             16 	 	         	4094
      05 	 	255.255.248.0 	 	/21             32 	 	         	2046
      06 	 	255.255.252.0 	 	/22             64 	 	         	1022
      07 	 	255.255.254.0 	 	/23             128 	 	     510
      08 	 	255.255.255.0 	 	/24             256 	 	     254
      09 	 	255.255.255.128 	/25             512 	 	     126
      10 	 	255.255.255.192 	/26             1024 	 	     62
      11 	 	255.255.255.224 	/27             2048 	 	     30
      12 	 	255.255.255.240 	/28             4096 	 	     14
      13 	 	255.255.255.248 	/29             8192 	 	     6
      14 	 	255.255.255.252 	/30             16384 	 	     2
      15 	 	255.255.255.253 	/31             32768 	 	     2 (*)

      \033[01;32mMáscaras de Subrede para Classe C\033[01;37m
      \033[01;31mClasse C – Padrão 255.255.255.0 com perfixo /24\033[01;37m
      \033[1;33mQnt Bits        Máscara             Prefixo     Subredes  (2^n)  Qnt Hosts ((2^n)-2)\033[0m
      01 	 	255.255.255.128 	/25             2 	 	         	126
      02 	 	255.255.255.192 	/26             4 	 	         	62
      03 	 	255.255.255.224 	/27             8 	 	         	30
      04 	 	255.255.255.240 	/28             16 	 	         	14
      05 	 	255.255.255.248 	/29             32 	 	         	6
      06 	 	255.255.255.252 	/30             64 	 	         	2
      07 	 	255.255.255.253 	/31             128 	 	     2 (*)
      " | expand -t 5
    }

    function jjPrintLineOfFile ()
    {
      if [ "$#" -ne 2 ]
      then
        echo -e "How to use:\n\t jjPrintLineOfFile <number|1,4> <file>"
      else
        sed -n ${1}p ${2}
      fi
    }

    function jjPublish ()
    {
      if [ "$#" -ne 1 ]
      then
        echo -e "How to use:\n\t jjPublish <port>"
      else
        ngrok http ${1}
      fi
    }

    function jjStandardOutput ()
    {
      echo -e "
      -------------------------------------------------------------------
      Ação \t Comando
      -------------------------------------------------------------------
      Redirecionar saída (stdout) para arquivo\t comando > saida.txt
      Redirecionar stderr para stdout\tcomando 2>&1
      Redirecionar stderr para stdout e para arquivo\tcomando 2>&1 > saida.txt
      Redirecionar stderr e stdout direto para arquivo\tcomando &> arquivo.txt
      " | expand -t 60
    }

    function jjUploadServer ()
    {
      if [ "$#" -ne 1 ]
      then
        echo -e "How to use:\n\t jjUploadServer <port>"
      else
        curl -s https://pastebin.com/raw/iBT95x0w > /tmp/jjUploadServer ; python /tmp/jjUploadServer ${1}
      fi
    }

    function jjVerifyMemoryOfProgram()
    {
        if [ "$#" -ne 1 ]
        then
            echo -e "How to use:\n\t jjVerifyMemoryOfProgram <pid|program name>"
            exit
        fi

        while true;
        do
            ps -eo size,pid,user,command --sort -size | grep -v grep | grep ${1} | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' |cut -d "" -f2 | cut -d "-" -f1
            sleep 3s
            clear
        done
    }
# }}}

# Alias
# {{{
    # Copy and Paste to clipboard
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'

    # List
    alias ll='ls -ls'

    # File
    alias _bashrc='source ~/.bashrc ; echo "Bashrc Atualizado"'
    alias __bashrc='vi ~/.bashrc'

    ## Directory navigation aliases
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias .....="cd ../../../.."



    # }}}

    # PS1
    # {{{
    PS1='[\T|\h - \w]$ '
    # }}}


    # History
    # {{{

    export HISTSIZE=100000
    export HISTFILESIZE=${HISTSIZE}
    export HISTCONTROL=ignoreboth
    export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'

    # }}}

    # Enable Color
    export TERM="xterm-256color"
# }}}
