"...................................
".......... Vim-PLug core ..........
"...................................

    if has('vim_starting')
        set nocompatible
    endif

    let vimplug_exists=expand('~/.vim/autoload/plug.vim')

    if !filereadable(vimplug_exists)

        silent execute "!echo Configurações VIMRC - Marcos Conceição - http://socram.io"

        silent !\curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    let g:not_finish_vimplug = "yes"
        autocmd VimEnter * PlugInstall
    endif

    call plug#begin(expand('~/.vim/plugged'))

    "... Pacotes...
        Plug 'majutsushi/tagbar'
        Plug 'maksimr/vim-jsbeautify'
        Plug 'kien/ctrlp.vim'
        Plug 'godlygeek/tabular'
        Plug 'joshdick/onedark.vim'
        Plug 'jiangmiao/auto-pairs'
        Plug 'vim-scripts/YankRing.vim'
        Plug 'tpope/vim-fugitive'
        Plug 'ap/vim-css-color'
        Plug 'kshenoy/vim-signature'
				Plug 'severin-lemaignan/vim-minimap'
				Plug 'vim-scripts/RltvNmbr.vim'
        Plug 'Quramy/tsuquyomi'
        Plug 'leafgarland/typescript-vim'
        Plug 'w0rp/ale'
        Plug 'Valloric/YouCompleteMe'
        Plug 'Shougo/vimproc.vim'


    call plug#end()
    filetype plugin indent on

    let mapleader=',' " Troca / por ,

"..............................................
".......... Configurações de macOSX  ..........
"..............................................
" set ttymouse=xterm2


"..............................................
".......... Configurações de Plugins ..........
"..............................................


  "... YouCompleteMe ...
    if !exists("g:ycm_semantic_triggers")
     let g:ycm_semantic_triggers = {}
     endif
     let g:ycm_semantic_triggers['typescript'] = ['.']

    let g:ycm_server_keep_logfiles = 1
    let g:ycm_server_log_level = 'debug'

  "... Ack ...
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    nmap <leader>aa :tab split<CR>:Ack! ""<Left>
    nmap <leader>A :tab split<CR>:Ack! "\W<C-r><C-w>\W"<CR>

    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''

  "... Tabular ...
    xnoremap <Leader>tt : Tabularize /

  "... TagBar ...
    noremap <Leader>t : TagbarToggle<CR>
    let g:tagbar_autofocus = 1

  "... CtrlP ...
    noremap <Leader>p : CtrlP <CR>
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|public\/images\|public\/system\|data\|log\|tmp\|node_modules$',
      \ 'file': '\.exe$\|\.so$\|\.dat$'
      \ }


  " ... vim-fugitive ...
    noremap <Leader>ga :Gwrite<CR> <esc>: echo "Arquivo [ " . expand('%:t'). " ] add to GIT"<CR>
    noremap <Leader>gc :Gcommit<CR> <esc>: echo "Commit" <CR>
    noremap <Leader>gp :Gpush<CR> <esc>: echo "Push on Master !!!" <CR>
    noremap <Leader>gll :Gpull<CR>
    noremap <Leader>gl :Gllog<CR>
    noremap <Leader>gs :Gstatus<CR>
    noremap <Leader>gb :Gblame<CR>
    noremap <Leader>gd :Gvdiff<CR>
    noremap <Leader>gr :Gremove<CR>


"......................................
"............. Aparência ..............
"......................................
colorscheme onedark
set term=gnome-256color
set term=screen-256color
set t_Co=256
set gcr=a:blinkon0
set scrolloff=3
set paste
" set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣


"..............................................
"............. Configurações Set ..............
"..............................................

" Geral
imap jj <esc>:echo 'ESC'<cr>   " jj funciona como esc no modo de edição
syntax on                      " Liga Syntax
set sm                         " Mostra par de parentese fechado
set wildmode=longest,list:full " Completa igual o bash
set showcmd                    " Mostra comando sendo executado no rodapé
set mouse=a                    " Habilita uso no mouse
set number                     " Número nas linhas
set foldlevelstart=99          " Não encurta funções
set foldlevel=99               " Não encurta funções
set ttymouse=


" Configura Status Bar
set laststatus=2                  " Mostra barra de Status
set statusline  +=%<[%n]          " Numero do buffer atual
set statusline  +=[%f%m]\         " Nome do arquivo aberto
set statusline  +=%=\Line:%l\/%L\ " Linha Atual
set statusline  +=%=\Column:%c%V  " Coluna Atual

" Configura Tab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

" Bucas / Replace
set hlsearch
set incsearch
set ignorecase
set smartcase

" Sempre coloca o proximo resultado no centro da tela
nnoremap n nzzzv
nnoremap N Nzzzv

" Desabilita arquivos de Backup
set nowrap
set nobackup
set nowritebackup
set noswapfile

" Configura Encode
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"..............................................
".......... Configurações de Buffers ..........
"..............................................
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
noremap <Leader>l  : set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

"..............................................
"........ Configurações de Abreviações ........
"..............................................
cnoreabbrev W! w
cnoreabbrev Q! q
cnoreabbrev Qall! qall
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
noremap <Leader>s : w<CR>
noremap <Leader>q : call JJ_Close()   <CR>
noremap <Leader>Q : qall!<CR>


"..............................................
"............... Seleção Visual ...............
"..............................................
vmap < <gv
vmap > >gv
noremap <Leader>a : <esc>ggVG<CR>
noremap <Leader>b : <esc>vi{ <CR>%

"..............................................
"........... Configurações de Split ...........
"..............................................
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"........................................
"........... Atalhos f1 - f12 ...........
"........................................

noremap <F1>  0
noremap <F2>  $
noremap <F3>  :call JJ_LateralPanel() <CR>
noremap <F4>  :call JJ_ChangeLog(1) <CR>
noremap <F12> :tabnew ~/.vimrc        <CR>

"........................................
"......... Funções de FileType ..........
"........................................

autocmd FileType javascript vnoremap <buffer> <leader>f :call RangeJsBeautify()   <cr>
autocmd FileType json       vnoremap <buffer> <leader>f :call RangeJsonBeautify() <cr>
autocmd FileType html       vnoremap <buffer> <leader>f :call RangeHtmlBeautify() <cr>
autocmd FileType css        vnoremap <buffer> <leader>f :call RangeCSSBeautify()  <cr>

"........................................
"......... Funções de Autoload ..........
"........................................


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup vimrc-format-file
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | exe "normal! zz"  | endif
augroup END"`'")"'")

augroup vimrc-cursor-line
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-load-vimrc
  autocmd!
  autocmd! bufwritepost ~/.vimrc source %
augroup END

augroup vimrc-load-changelog
  autocmd!
  autocmd BufWritePre * keepjumps call JJ_ChangeLog(2)
augroup END

augroup vimrc-mostra-buffer-ativo
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END


" augroup vimrc-habilita-LateralPanel
  " autocmd!
  " autocmd VimEnter * :call JJ_LateralPanel()
" augroup END


".......................................................................
"........... Minha funções JJ que subistituem muitos plugins ...........
".......................................................................

  "... NerdTree Like ...
    fun! JJ_LateralPanel()
      let g:netrw_winsize = -40
      let g:netrw_banner=0
      let g:netrw_browse_split=4
      let g:netrw_altv=1
      let g:netrw_liststyle=3
      let g:netrw_preview=1
      let g:netrw_list_hide=netrw_gitignore#Hide()
      let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
      Lexplore
    endfun


    "... Comentarios ...
     let s:comment_map = {
        \   "yml"        : '#',
        \   "c"          : '\/\/',
        \   "javascript" : '\/\/',
        \   "php"        : '\/\/',
        \   "html"       : '\<\!\-\-',
        \   "python"     : '#',
        \   "ruby"       : '#',
        \   "sh"         : '#',
        \   "conf"       : '#',
        \   "profile"    : '#',
        \   "bashrc"     : '#',
        \   "vim"        : '"',
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


    "... Fecha buffer por buffer ...
      fun! JJ_Close()
        let g:numberBuffer =  len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if g:numberBuffer >= 2
          let g:bufferName = bufname('')
            execute "bdelete! " . g:bufferName
          else
            execute ":q!"
        endif
      endfun

    "... Ctags ...
     fun! JJ_Ctags()
       execute ":r! ctags -R --exclude=.git --exclude=node_modules -R . "
     endfun

     noremap <Leader>T : call JJ_Ctags()<CR>


    "... Criar Marcações  ...
      let g:linesAdd = []
      let g:linesDescription= []

      fun! JJ_Point(action)

        if a:action == 1
         exe "normal m,"
        endif

        if a:action == 2
         exe "normal m/"
        endif

        if a:action == 3
          exe "normal m "
        endif
      endfun

      " Criar Marcação
        noremap <Leader>m : call JJ_Point(1) <CR>
      " Lista Marcações
        noremap <Leader>mm : call JJ_Point(2) <CR>
      " Limpa Marcações
        noremap <Leader>mmm : call JJ_Point(3) <CR>

      "... Mostra definições dos Snippets para arquivo aberto  ...
      fun! JJ_Snippets()
        let extension = expand('%:e')
        let fileName = '~/.vim/plugged/vim-snippets/snippets/'.extension.'.snippets'
        execute "leftabove vnew ".fileName
        vertical resize 50
      endfun

      noremap <Leader>hh : call JJ_Snippets() <CR>


      " ... Gerenciador de Clipboard

      fun! JJ_Clipboard()
        execute ":YRShow"
      endfun

      noremap <Leader>, : call JJ_Clipboard() <CR>

      " ... Adiciona Header Aquivo

    fun! JJ_ChangeLog(action)

      if a:action == 1
        let l:flag=0
        for i in range(1,5)
            if getline(i) !~ '.*Last Change.*'
                let l:flag = l:flag + 1
            endif
        endfor
        if l:flag >= 5
            normal(1G)
            call append(0, "-------------------------------------------------------------------")
            call append(1, "   Created: " . strftime("%a %d/%b/%Y %H:%M"))
            call append(2, "   Updated: " . strftime("%a %d/%b/%Y %H:%M"))
            call append(3, "   Author: Marcos Conceicao <socram.io>")
            call append(4, "-------------------------------------------------------------------")
            normal gg
       " normal
        endif
      endif

      if a:action == 2

        let _s=@/
        let l = line(".")
        let c = col(".")
        if line("$") >= 5
            1,5s/\s*Updated:\s*\zs.*/\="" . strftime("%Y %b %d %X")/ge
        endif
        let @/=_s
        call cursor(l, c)

      endif

    endfun

".........................................
"........... Áreas para testes ...........
".........................................

