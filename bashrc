# ------- JJ BashRC

# Model 
# {{{

        
  
# }}}


# Functions
# {{{

    function move_to_trash () 
    {
        clean=`echo "$@" | sed 's/-rf//' `
        mv ${clean} ~/.local/share/Trash/files
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

        # Rm files
        alias rm='move_to_trash'


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
#       Shift   +  ~   =   ã
    
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
