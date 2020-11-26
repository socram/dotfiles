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
        Plug 'godlygeek/tabular'
        Plug 'joshdick/onedark.vim'
        Plug 'vim-scripts/RltvNmbr.vim'
        Plug 'w0rp/ale'

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

  "... Tabular ...
    xnoremap <Leader>tt : Tabularize /

  "... TagBar ...
    noremap <Leader>t : TagbarToggle<CR>
    let g:tagbar_autofocus = 1


"......................................
"............. Aparência ..............
"......................................
colorscheme onedark
" set term=gnome-256color
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
" imap jj <esc>:echo 'ESC'<cr>   " jj funciona como esc no modo de edição
syntax on                      " Liga Syntax
set sm                         " Mostra par de parentese fechado
set wildmode=longest,list:full " Completa igual o bash
set showcmd                    " Mostra comando sendo executado no rodapé
set mouse=a                    " Habilita uso no mouse
set number                     " Número nas linhas
set number relativenumber      " Número relativos nas linhas
set foldlevelstart=99          " Não encurta funções
set foldlevel=99               " Não encurta funções
set ttymouse=
set spell spelllang=pt         " Add dicionario para vim


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
noremap <Leader>s : w<CR>
noremap <Leader>q : call JJ_Close()   <CR>
noremap <Leader>Q : qall!<CR>

"..............................................
"........... Corretor Ortográfico .............
"..............................................
noremap <Leader>z z=

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
"......... Funções de Autoload ..........
"........................................

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

augroup vimrc-mostra-buffer-ativo
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

".......................................................................
"........... Minha funções JJ que subistituem muitos plugins ...........
".......................................................................

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

      "... Comentarios ...
     let s:comment_map = {
        \   "c"          : '\/\/',
        \   "javascript" : '\/\/',
        \   "html"       : '\<\!\-\-',
        \   "python"     : '#',
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




    "... Executa comando no shell
    fun! JJ_RunShellCommand(cmdline)
      echo a:cmdline
      let expanded_cmdline = a:cmdline
      for part in split(a:cmdline, ' ')
         if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
         endif
      endfor
      botright new
      setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
      execute '$read !'. expanded_cmdline
      setlocal nomodifiable
      1
    endfun
noremap <Leader>n : call JJ_RunShellCommand('systemctl restart nginx') <cr>
".........................................
"........... Áreas para testes ...........
".........................................
