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

        Plug 'msanders/snipmate.vim'
        Plug 'majutsushi/tagbar'
        Plug 'kien/ctrlp.vim'
        Plug 'scrooloose/syntastic'
        Plug 'godlygeek/tabular'
        Plug 'joshdick/onedark.vim'

    call plug#end()
    filetype plugin indent on

    let mapleader=',' " Troca / por ,

"..............................................
".......... Configurações de Plugins ..........
"..............................................

  "... Tabular ...
    xnoremap <Leader>t= : Tabularize /=<CR>
    xnoremap <Leader>t: : Tabularize /:<CR>
    xnoremap <Leader>t# : Tabularize /#<CR>
    xnoremap <Leader>t" : Tabularize /"<CR>
    xnoremap <Leader>tt : Tabularize /
     
  "... TagBar ...     
    noremap <Leader>t : TagbarToggle<CR>
    let g:tagbar_autofocus = 1

  "... CtrlP ...
    noremap <Leader>p : CtrlP <CR>
      
  "... Syntastic ...
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_style_error_symbol = '✗'
    let g:syntastic_style_warning_symbol = '⚠'
    let g:syntastic_auto_loc_list=1
    let g:syntastic_aggregate_errors = 1
      

"......................................
"............. Aparência ..............
"......................................
colorscheme onedark
set term=gnome-256color
set term=screen-256color
set t_Co=256

"..............................................
"............. Configurações Set ..............
"..............................................

" Geral
imap jj <esc>                           " jj funciona como esc no modo de edição
autocmd! bufwritepost ~/.vimrc source % " Carrega automaticamente vimrc qnd codificado
syntax on                               " Liga Syntax
set sm                                  " Mostra par de parentese fechado
set wildmode=longest,list:full          " Completa igual o bash
set showcmd                             " Mostra comando sendo executado no rodapé
set mouse=a                             " Habilita uso no mouse
set nu                                  " Número nas linhas
set foldlevelstart=99                   " Não encurta funções
set foldlevel=99                        " Não encurta funções




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
noremap <Leader>f : /
noremap <Leader>g : %s/
vnoremap // y/\V<C-R>"<CR>          "Faz pesquisa por palavra selecionada usando //

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
noremap <F12> :tabnew ~/.vimrc        <CR>



".......................................................................
"........... Minha funções JJ que subistituem muitos plugins ...........
".......................................................................

  "... NerdTree Like ...
    fun! JJ_LateralPanel()
      let g:netrw_winsize = -25
      let g:netrw_banner=0
      let g:netrw_browse_split=4
      let g:netrw_altv=1
      let g:netrw_liststyle=3
      let g:netrw_list_hide=netrw_gitignore#Hide()
      let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
      Lexplore
    endfun

    "... Comentarios ...
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
       execute ":r! ctags -R . "
     endfun

     noremap <Leader>T : call JJ_Ctags()<CR>
     
     
    "... Criar Marcações  ...
      let g:linesAdd = []
      let g:linesDescription= []

      fun! JJ_Point(action)

        if a:action == 1 
          let g:currentLine = line(".")
          let g:lineDescription= getline(".")

          sign define jjBreakPoint text=➙ texthl=JJ_Point
          execute ":sign place 2 line=" .g:currentLine. " name=jjBreakPoint file=" . expand("%:p")

          call add(g:linesAdd, g:currentLine)
          call add(g:linesDescription, g:lineDescription)
        endif

        if a:action == 2
          echon "Break Points"
          let g:count=1

          let size=len(g:linesDescription)

          for i in range(size)
            echo "Line ➙ [". g:count . "] Content ➙ [" . g:linesDescription[ i ] . "]"
            let g:count += 1
          endfor

          let position = input(": ")
          execute "".g:linesAdd[position -1 ]
        endif

        if a:action == 3 
          let size=len(g:linesDescription)
          for i in range(size)
            execute 'sign unplace 2'
            let g:linesAdd = []
            let g:linesDescription= []
          endfor
        endif
      endfun

      " Criar Marcação
        noremap <Leader>m : call JJ_Point(1) <CR>
      " Vai para Marcação   
        noremap <Leader>mm : call JJ_Point(2) <CR>  
      " Limpa Marcações
        noremap <Leader>mmm : call JJ_Point(3) <CR> 

      "... Mostra definições dos Snippets para arquivo aberto  ...
      fun! JJ_Snippets()
        let extension = expand('%:e')
        let fileName = '~/.vim/plugged/snipmate.vim/snippets/'.extension.'.snippets'
        execute "leftabove vnew ".fileName
        vertical resize 50
      endfun

      noremap <Leader>hh : call JJ_Snippets() <CR> 
".........................................
"........... Áreas para testes ...........
".........................................

