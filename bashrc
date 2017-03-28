# ------- JJ BashRC

# Model 
# {{{

        
  
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

# Environment variables
# {{{
        export JJPATH=~/.FuncoesJJ.sh
        source $JJPATH 
# }}}

# Configure Keyboard
# {{{
        setxkbmap -model pc105 -layout us_intl
        #   Shift   +  ~   =   ã
# }}}

# History 
# {{{

        export HISTSIZE=1000            
        export HISTFILESIZE=${HISTSIZE} 
        export HISTCONTROL=ignoreboth   
        export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
  
# }}}
        
