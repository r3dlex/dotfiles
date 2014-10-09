"------------------------------------------------------------
"------------------------------------------------------------
"-- MY FUCKING VIMRC FULL OF AWESOMENESS AND RAINBOW VOMITS--
"-------------------------R3DLEX-----------------------------
"------------------------------------------------------------
"------------------------------------------------------------

if has('vim_starting')
  set nocompatible               " Be iMproved
  "Required
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Valloric/YouCompleteMe',
      \ {
      \   'build': {
      \     'unix' : './install.sh --clang-completer',
      \     'mac'  : './install.sh --clang-completer'
      \   }
      \ }
" non-GitHub repos
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'kien/ctrlp.vim' 
NeoBundle 'rhysd/vim-clang-format'
let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hewes/unite-gtags' 
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'scrooloose/nerdcommenter' 
NeoBundle 'wting/rust.vim'
call neobundle#end()

"Required by neobundle
filetype plugin indent on

syntax enable
set background=dark
colorscheme desert

"Sets font size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"autocomplete
set wildmenu

"last commands
set showcmd

" word-wrapping
" prevents vim from inserting a line break
set textwidth=0
set wrapmargin=0
set wrap nolist 
set formatoptions+=l

"backspacing auto indent, line breaks and insert
set backspace=indent,eol,start

"Tabs
set tabstop=2 shiftwidth=2 expandtab

"change some default behaviours
set autoindent
set nostartofline
set ruler
set number
set nu
set nocompatible
set nobackup

if has('mouse')
    set mouse=a
endif

filetype plugin on
filetype indent on

autocmd FocusGained * let @z=@+
"Changes current directory automatically, excluding /tmp
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

set laststatus=2
set tags=tags;/

"Clang-format configs for Google C++ style, which is the default
let g:clang_format#style_options = {
  \ "AccessModifierOffset" : -4,
  \ "AllowShortIfStatementsOnASingleLine" : "true",
  \ "AlwaysBreakTemplateDeclarations" : "true",
  \ "Standard" : "C++11"}
"clang-format call
let g:clang_format#command = "clang-format"

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

"Maps the leader command for general usage. This one is useful for it is close
"to h, j, k, l
let mapleader = ';'

"NERDCommenter - Mapping C-t to comment in visual and normal modes. 
"C-t is usually mapped to tag stack but since it is unused... 
nmap <C-t> <plug>NERDCommenterToggle
vmap <C-t> <plug>NERDCommenterToggle

" command-t
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap <silent> <Leader>bt :CommandT<CR>
nnoremap <silent> <Leader>bl :CommandTBuffer<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Maps Ctrl+s to save
map <C-S> :w<CR>

" Maps Ctrl+W to close buffer
map <C-W> :bdelete<CR>

"Alternates .h to or from .cpp/.c
map <silent> <C-Tab> :A<CR>

"set clipboard+=unnamed
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
vmap <C-V> "+gP
vmap <S-Insert>  	"+gP
nmap <C-V> "+gP
nmap <S-Insert>  	"+gP

cmap <C-V>  	<C-R>*
cmap <S-Insert> 	<C-R>*

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   	<C-V>

" Escape is light years away!
:imap jk <Esc>

" easymotion 2-char search config
nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-s)
" easymotion find
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" enabling smartcase
let g:EasyMotion_smartcase = 1
" JK motions: Line motions (visible lines)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Ctrl+i for clang-format indentation 
autocmd FileType c,cpp,objc nnoremap <buffer><C-h> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><C-h> :ClangFormat<CR>

"Ctrlp rebindding to Ctrl-p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-S-p> :CtrlPMixed<CR>
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=32
" Ignore some folders and binary files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|metadata|build*)$',
  \ 'file': '\v\.(exe|so|dll|bin|o|a|png|jpeg|jpg|pdf|class)$',
  \ }

" Clang complete 
let g:clang_library_path = '/Users/afb/.vim/bundle/YouCompleteMe/third_party/ycmd'
let g:clang_use_library=1
let g:clang_user_options = "-std=c++11"
"nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

"Unite gtags
nnoremap [unite] <Nop>
nmap <space> [unite]
let g:unite_source_gtags_project_config = {
      \ '_': { 'treelize': 1 }
      \ }
map [unite]gg :execute 'Unite gtags/def:'.expand('<cword>')<CR>
map [unite]gt :execute 'Unite gtags/completion'<CR>
map [unite]gc :execute 'Unite gtags/context'<CR>
map [unite]gr :execute 'Unite gtags/ref'<CR>
map [unite]ge :execute 'Unite gtags/grep'<CR>
map [unite]gg <ESC>:execute 'Unite gtags/def:'.GetVisualSelection()<CR>

" Unite mapping
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"map <C-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
map [unite]p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
map [unite]f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
map [unite]r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
map [unite]o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
map [unite]y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
map [unite]e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-q>   <Plug>(unite_exit)
  vmap <buffer> <C-q>   <Plug>(unite_exit)
endfunction

"Source edition
map <leader>ev :e ~/.vimrc<CR>
map <leader>sv :so ~/.vimrc<CR>

" Complete options (disable preview scratch window, longest removed to always
" show menu)
set completeopt=menu,menuone
" Limit popup menu height
set pumheight=10

"------------------------------------------------------------
" GUI options
set guioptions=

"Correct Bash syntax for all bash files
au BufNewFile,BufRead .bashrc*,.bash_exports,.bash_aliases,.bash_functions,.bash_exports,.bash_wine,bashrc,bash.bashrc,.bash_profile*,.bash_logout*,*.bash,*.ebuild call SetFileTypeSH("bash")

"Correct vim highlight for different files
au BufNewFile,BufRead .vimrc,.vimperatorrc set filetype=vim

"Vim 7.3 detects example.pc as filetype 'proc' but has no syntax highlighting for Pro C. Override it so that it highlights as C. 
au BufRead,BufNewFile *.pc set filetype=c

"Checks if current plugins are up-to-date
NeoBundleCheck
