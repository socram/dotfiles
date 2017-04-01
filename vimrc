" Vim-PLug core:
" {{{
    if has('vim_starting')
        set nocompatible
    endif
    let vimplug_exists=expand('~/.vim/autoload/plug.vim')
    if !filereadable(vimplug_exists)

        silent execute "!echo Installing VIM-PLUG"

        silent !\curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    let g:not_finish_vimplug = "yes"
        autocmd VimEnter * PlugInstall
    endif
    call plug#begin(expand('~/.vim/plugged'))

    " Plug install packages:
    " {{{

        Plug 'msanders/snipmate.vim'
        Plug 'majutsushi/tagbar'
        Plug 'mconceicao/vim-colors'
        Plug 'kien/ctrlp.vim'
        Plug 'scrooloose/syntastic'
        Plug 'godlygeek/tabular'

    " }}}


    call plug#end()
    filetype plugin indent on

" }}}



    " Load my Snippets
    " {{{

        let snippets=expand('~/.vim/plugged/snipmate.vim/README.markdown')
        let my_snippets=expand('~/.vim/plugged/snipmate.vim/snippets/README.md')

        if filereadable(snippets)
            if !filereadable(my_snippets)
                silent execute "!echo Installing MY SNIPPETS"
                silent exec "!rm -rf ~/.vim/plugged/snipmate.vim/snippets/* ; rm -rf ~/.vim/plugged/snipmate.vim/snippets/.git"
                silent exec "!git clone https://github.com/mconceicao/snippets-vim.git ~/.vim/plugged/snipmate.vim/snippets"
            endif
        endif

      " }}}


    " Download Check Spell
    " {{{

        let spellDirectory=expand('~/.vim/spell/README.md')

        if !filereadable(spellDirectory)
            silent execute "!echo Installing Spell Check"
            silent exec "!git clone https://github.com/mconceicao/vim-check-spell.git  ~/.vim/spell"
        endif


      " }}}




" Basic Setup:
" {{{

    let mapleader=','
    set wildmode=longest,list
    set shell=/bin/bash
    set foldlevelstart=99

" }}}

" AutoCmd:
" {{{

    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


" }}}



" Aparece:
" {{{

    colorscheme molokai
    set laststatus=2
    set statusline=%<Buffer[%n]\ %f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \ %=\ Line:%l\/%L\ Column:%c%V
    set number
    syntax on

" }}}

" Configure Plugins / Function:
" {{{


    " Tabular:
    " {{{

        xnoremap <Leader>t= : Tabularize /=<CR>
        xnoremap <Leader>t: : Tabularize /:<CR>
        xnoremap <Leader>t# : Tabularize /#<CR>

    " }}}


    " TagBar:
    " {{{

        noremap <Leader>t : TagbarToggle<CR>
        let g:tagbar_autofocus = 1

    " }}}

    " CtrlP:
    " {{{

        noremap <Leader>p : CtrlP <CR>

    " }}}

    " Syntastic:
    " {{{

        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        let g:syntastic_style_error_symbol = '✗'
        let g:syntastic_style_warning_symbol = '⚠'
        let g:syntastic_auto_loc_list=1
        let g:syntastic_aggregate_errors = 1

    " }}}


" }}}

" Buffers:
" {{{

    set hidden
    noremap <Leader>0 : b
    noremap <Leader>1 : b1 <CR>
    noremap <Leader>2 : b2 <CR>
    noremap <Leader>3 : b3 <CR>
    noremap <Leader>4 : b4 <CR>
    noremap <Leader>5 : b5 <CR>
    noremap <Leader>6 : b6 <CR>
    noremap <Leader>7 : b7 <CR>
    noremap <Leader>8 : b8 <CR>
    noremap <Leader>9 : b9 <CR>

    noremap <Leader>ba : badd
    noremap <Leader>bd : bdelete
    noremap <Leader>h  : leftabove vnew 
    noremap <Leader>v  : rightbelow new 
    noremap <Leader>l  : ls <CR>

" }}}

" Tabs:
" {{{

    set tabstop=4
    set softtabstop=0
    set shiftwidth=4
    set expandtab

" }}}

" Search / Replace:
" {{{

    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    noremap <Leader>f : /
    noremap <Leader>g : %s/

" }}}

" BackUp / Swap:
" {{{

    set nowrap
    set nobackup
    set nowritebackup
    set noswapfile

" }}}

" Encoding:
" {{{

    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8

" }}}

" Map F1-F10:
" {{{

    noremap <F1>  0
    noremap <F2>  $
    noremap <F3>  :call JJ_LateralPanel() <CR>
    noremap <F4>  :echo "Não Mapeado "     <CR>
    noremap <F5>  :echo "Não Mapeado "    <CR>
    noremap <F6>  :echo "Não Mapeado "
    noremap <F7>  :echo "Não Mapeado "
    noremap <F8>  :so ~/.vimrc     <CR>
    noremap <F9>  :call JJ_HelpSnippet()<CR>
    noremap <F10> :echo "Não Mapeado "    <CR>
    noremap <F12> :tabnew ~/.vimrc        <CR>


    noremap <Leader>f1 : call JJ_Help() <CR>

" }}}

" Save / Close:
" {{{

    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq!
    cnoreabbrev Wa wa!
    cnoreabbrev wQ wq!
    cnoreabbrev WQ wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall!
    noremap <Leader>s : w<CR>
    noremap <Leader>q : q!   <CR>
    noremap <Leader>Q : qall!<CR>

" }}}

" Change Split:
" {{{

    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

" }}}

" Visual Selection:
" {{{

    vmap < <gv
    vmap > >gv

    noremap <Leader>a : <esc>ggVG<CR>
    noremap <Leader>b : <esc>vi{ <CR>%

    " set mouse=a

" }}}


" Functions:
" {{{


    " Ctags:
    " {{{

        fun! JJ_Ctags()

           execute ":r! ctags -R . "

        endfun

        noremap <Leader>T : call JJ_Ctags()<CR>

    " }}}


    " Show Indentation Code:
    " {{{

        let g:show=1

        fun! JJ_Indentation()
            if g:show
                execute ":match"

                set nolist
                set nocursorline

                let g:show = 0
            else
                set list lcs=eol:¬,trail:·

                set cursorline
                hi CursorLine ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
                hi Cursor ctermbg=15 ctermfg=8

                execute ":match ExtraWhitespace /\s\+$\| \+\ze\t/"
                execute ":match ExtraWhitespace /[^\t]\zs\t\+/"
                execute ":match ExtraWhitespace /^\t*\zs \+/"

                match ExtraWhitespace /\s\+$/

                let g:show = 1
            endif
        endfun

        noremap <Leader>i : call JJ_Indentation()<CR> : echo '' <CR>


    " }}}

    " Side Panel:
    " {{{

        fun! JJ_LateralPanel()

            let g:netrw_winsize = -25
            let g:netrw_banner=0
            let g:netrw_browse_split=4
            let g:netrw_altv=1
            let g:netrw_liststyle=3
            let g:netrw_list_hide=netrw_gitignore#Hide()
            let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

            Lexplore
            setlocal statusline=\ \ \ \ \ \ \ JarvisTREE\ \ \ \ \ \ \

        endfun

    " }}}

    " Help Snnippets:
    " {{{

        let g:open=1
        let g:defaultName="~/.vim/plugged/snipmate.vim/"
        fun! JJ_HelpSnippet()

            let format= &filetype
            let buffer_name = "~/.vim/plugged/snipmate.vim/snippets/".format.".snippets"
            if g:open
                set foldlevelstart=99
                execute "vsplit" .buffer_name
                vertical resize -30
                let g:open = 0
            else
                execute "bdelete! " . g:defaultName
                let g:open = 1
            endif

        endfun

    " }}}

    " Comment Code:
    " {{{

        let s:comment_map = {
        \   "yml": '#',
        \   "c": '\/\/',
        \   "javascript": '\/\/',
        \   "php": '\/\/',
        \   "html": '\<\!\-\-',
        \   "python": '#',
        \   "ruby": '#',
        \   "sh": '#',
        \   "conf": '#',
        \   "profile": '#',
        \   "bashrc": '#',
        \   "bat": 'REM',
        \   "DOSBATCH": 'REM',
        \   "vim": '"',
        \ }

        fun! JJ_Comment()
            if has_key(s:comment_map, &filetype)
                let comment_leader = s:comment_map[&filetype]
            if getline('.') =~ "^\\s*" . comment_leader . " "
                execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
            else
                if getline('.') =~ "^\\s*" . comment_leader
                    execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
                else
                    execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
                end
            end
            else
                echon "No comment for filetype -> " . &filetype ." "
            end
        endfu
        nnoremap <leader>c :call JJ_Comment()<cr>
        vnoremap <leader>c :call JJ_Comment()<cr>

    " }}}



    " Automatic Closing:
    " {{{

            fun! JJ_AutomaticClosing(open, close)
                let line = getline('.')
                let col = col('.')
                if col < col('$') || stridx(line, a:close, col + 1) != -1
                    return a:open
                else
                    return a:open . a:close . repeat("\<left>", len(a:close))
                endif
            endfun

            inoremap <expr> ( JJ_AutomaticClosing('(', ')')
            inoremap <expr> { JJ_AutomaticClosing('{', '}')
            inoremap <expr> [ JJ_AutomaticClosing('[', ']')
            inoremap <expr> ` JJ_AutomaticClosing('`', '`')
            inoremap <expr> " JJ_AutomaticClosing('"', '"')
            inoremap <expr> ' JJ_AutomaticClosing("'", "'")

    " }}}


    " Auto Complete with Ctrl + Space:
    " {{{

            fun! JJ_AutoComplite()
                let col = col('.') - 1
                if !col || getline('.')[col - 1] !~ '\k'
                    return "\<tab>"
                else
                    return "\<c-x>\<c-o>"
                endif
            endfun

            inoremap <Nul> <c-r>=JJ_AutoComplite()<cr>

    " }}}

    " Check Spell Portuguese + English:
    " {{{
            fun! JJ_CheckSpell()

                echo "JJ_CheckSpell" | echo "   Clear All [0]" | echo "   Portuguese [1]" | echo "   English   [2]"

                let g:language = input(': ')

                if g:language == 0 | setlocal nospell| endif
                if g:language == 1 | setlocal spell spelllang=pt | endif
                if g:language == 2 | setlocal spell spelllang=en_us | endif

            endfun

            noremap <Leader>co : call JJ_CheckSpell()<CR>

    " }}}

    " Help All custom Functions:
    " {{{
           fun! JJ_Help()

               echo " "
               echo "          -JJ_Help-         "
               echo " "

               echo "+----------------------------------------------------------------------------------+"
               echo "|             FUNCTIONS                   |         F1 - F10                       |"
               echo "+----------------------------------------------------------------------------------+"
               echo "|                                         |                                        |"
               echo "|       JJ_Ctags()                        |      <F1>  0                           |"
               echo "|       JJ_Indentation()                  |      <F2>  $                           |"
               echo "|       JJ_LateralPanel()                 |      <F3>  :call JJ_LateralPanel()     |"
               echo "|       JJ_HelpSnippet()                  |      <F4>  :Não Mapeado                |"
               echo "|       JJ_Comment()                      |      <F5>  :Não Mapeado                |"
               echo "|       JJ_AutomaticClosing(open, close)  |      <F6>  :Não Mapeado                |"
               echo "|       JJ_AutoComplite()                 |      <F7>  :Não Mapeado                |"
               echo "|       JJ_CheckSpell()                   |      <F8>  :so ~/.vimrc                |"
               echo "|       JJ_Help()                         |      <F9>  :call JJ_HelpSnippet()      |"
               echo "|                                         |      <F10> :echo Não Mapeado           |"
               echo "|                                         |      <F12> :tabnew ~/.vimrc            |"
               echo "+----------------------------------------------------------------------------------+"

           endfun
    " }}}



    " Create Break Point and Jump to specific row:
    " {{{

        " sign define jjBreakPoint text=➤ texthl=JJ_BreakPoint
        " sign define jjBreakPoint text=✓ texthl=JJ_BreakPoint
        " sign define jjBreakPoint text=✩ texthl=JJ_BreakPoint
        " sign define jjBreakPoint text=✦ texthl=JJ_BreakPoint

            let g:linesAdd = []

            fun! JJ_CreateBreakPoint()

                sign define jjBreakPoint text=➙ texthl=JJ_BreakPoint

                let g:linhaAtual = line(".")

                execute ":sign place 2 line=" .g:linhaAtual. " name=jjBreakPoint file=" . expand("%:p")

                call add(g:linesAdd, g:linhaAtual)

                echo g:linesAdd

            endfun

            fun! JJ_ChangeBreakPoint()

                echon "Break Points"
                echo g:linesAdd

                let position = input(": ")
                execute "".g:linesAdd[position]
                " execute ":zz"

            endfun


            fun! JJ_ClearBreakPoint()

                for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
                    execute 'sign unplace 2'
                endfor
            endfun


            noremap <Leader>m : call JJ_CreateBreakPoint()<CR>
            noremap <Leader>mm : call JJ_ChangeBreakPoint()<CR>
            noremap <Leader>mmm : call JJ_ClearBreakPoint()<CR>

    " }}}

" }}}
