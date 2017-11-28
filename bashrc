# ------- JJ BashRC

# Functions
# {{{


    function jj ()
    {
        cat ~/.bashrc | grep 'function jj' | tr -d '\t' | cut -d ' ' -f6 | grep . 
    }
    
    function jjInitializePrograms ()
    {

      # Initialize Bluetooth
      ps cax | grep bluetooth > /dev/null

      if [ $? -eq 1 ]; 
      then
        echo "Init Bluetooth"
        sudo /etc/init.d/bluetooth start
      fi

      # Initialize Keyboard
      setxkbmap -model pc105 -layout us_intl

      # Initialize Tmux
      if command -v tmux >/dev/null
      then
        if [ ! -z "$PS1" ]; then 
          [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux -2 new -s main
        fi
      fi
    }


    jjInitializePrograms 

    function jjLocalServer ()
    {
        python -m SimpleHTTPServer 8000 
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
    
    function jjUploadServer ()
    {
			if [ "$#" -ne 1 ]
			then
				echo -e "How to use:\n\t jjUploadServer <port>"
			else
			curl -s https://pastebin.com/raw/iBT95x0w > /tmp/jjUploadServer ; python /tmp/jjUploadServer ${1}
			fi 
			} 
    
	 
    
    function jjConverterBitCoinToReal ()
    {
        valorEmBitCoin=`echo ${1} | tr -d '฿| ' | tr ',' '.'`
        valorAtualEmReal=`curl -s curl http://api.coindesk.com/v1/bpi/currentprice/BRL.json | jq '.bpi.BRL.rate_float' `

        valorEmReal=`echo "${valorAtualEmReal} * ${valorEmBitCoin}" | bc`

        echo "Valor em Real -> " ${valorEmReal}
    }

    function jjBitCoinToReal ()
    {
       valorAtualEmReal=`curl -s curl http://api.coindesk.com/v1/bpi/currentprice/BRL.json | jq '.bpi.BRL.rate_float' `

       echo "Valor em Real -> " ${valorAtualEmReal}
    }


    function jjConferenceRoom ()
    {
	    room=`tr -dc A-Za-z0-9_ < /dev/urandom | head -c 15 | sed 's/$/\n/g'`
	    google-chrome "appear.in/${room}"
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

    function jjCreateRandomPassword ()
    {
        </dev/urandom tr -dc '1234567890!@#$%^&()_+ABCDEFGHIJLMNOPQRSTUVXZabcdefghijlmnopqrstuvxz' | head -c $1; echo ""
    }    



    function jjKill ()
    {
		    kill -9 $(ps -ef | grep $1 | awk '{print $2} ')
    }

    function jjConfigureGit ()
    {
      git config --global user.name "mconeicao"
      git config --global user.email mconceicao@protonmail.com
      git config --global core.editor vi
      git config --global merge.tool vimdiff
        
      echo "git remote add origin <endereco>"

    }

# }}}



# Alias 
# {{{
        # Copy and Paste to clipboard
        alias pbcopy='xsel --clipboard --input'
        alias pbpaste='xsel --clipboard --output'

        # List
        alias ll='ls -ls'

        # File _
        alias _bashrc='source ~/.bashrc ; echo "Bashrc Atualizado"'
        alias __bashrc='vi ~/.bashrc'


# }}}

# PS1 
# {{{
        PS1='[\w]$ '
# }}}


# History 
# {{{

        export HISTSIZE=1000            
        export HISTFILESIZE=${HISTSIZE} 
        export HISTCONTROL=ignoreboth   
        export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
  
# }}}
       

# Color to man page 
# {{{
    export PAGER=less
    export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
    export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
    export LESS_TERMCAP_me=$'\E[0m'           # end mode
    export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
    export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
    export LESS_TERMCAP_ue=$'\E[0m'           # end underline
    export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
# }}}   


# Enable Color 
export TERM="xterm-256color"

# Logo
echo '- -  - -'
echo '>  JJ  <'
echo '- -  - -'
