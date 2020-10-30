
call plug#begin('~/.vim/plugged')

if exists('g:gui_oni')
  " Onivim does all the below stuff itself, best leave it alone
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
else 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Only use deoplete on the terminal 
  let g:deoplete#enable_at_startup = 1

  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  " Async autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Completion from other opened files
  Plug 'Shougo/context_filetype.vim'
  " Python autocompletion
  Plug 'zchee/deoplete-jedi'

  "Clever autocompletion
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  " Table mode
  Plug 'dhruvasagar/vim-table-mode'
  let g:table_mode_corner_corner='+'
  let g:table_mode_header_fillchar='='

  " Automatically start language servers.
  let g:LanguageClient_autoStart = 1
"let g:LanguageClient_rootMarkers = [
"\ '.git'
"\ 'default.nix',
"\ 'package-lib.yaml',
"\ '*.cabal',
"\ 'stack.yaml',
"\ ]
  let g:LanguageClient_serverCommands = {
    \ 'javascript' : ['node','~/.npm-global/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio','-l','/tmp/jsls.log'],
    \ 'python': ['pyls','--log-file','/tmp/pyls.log'],
    \ 'haskell' : ['hie-wrapper','--debug', '--vomit','--lsp','-l','/tmp/hie.log'],
    \ 'vue' : ['vls','--stdio']
    \ }


  let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
  let g:LanguageClient_loggingFile = '/tmp/lsp-client.log'
  let g:LanguageClient_settingsPath = "~/.vim/lsp-settings.json"

  if has('mouse')
    set mouse=a
  endif

endif

Plug 'jeetsukumaran/vim-buffergator'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'purescript-contrib/purescript-vim'
Plug 'neovimhaskell/haskell-vim',
Plug 'frigoeu/psc-ide-vim'
Plug 'toyamarinyon/vim-swift'
Plug 'lumiliet/vim-twig'
Plug 'posva/vim-vue'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

"=========================== Set 24 bit colour ==============================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
"============================= Set Clipboard to Sys Clipboard ===============
set clipboard=unnamedplus
"=========================== Sets Line Numbering on =========================
set nu
set relativenumber
"============================ Sets colour syntax on =========================
syn on!
"============================== Sets cursor line ============================
set cursorline
"======================== Sets indentation correctly ========================
set autoindent
set smartindent
set shiftround
"=============== Don't forget history when changing buffers =================
set hidden
"  or ever...
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000
"============================ Vue Markup ====================================
let g:vue_disable_pre_processors = 1
au BufNewFile,BufRead *.vue set filetype=vue
"=========================== Purescript Markup ==============================
au BufNewFile,BufRead *.psc set filetype=purescript
au BufNewFile,BufRead *.purs set filetype=purescript
"=========================== QML Markup =====================================
au BufNewFile,BufRead *.qml set filetype=qml
"=========================== Swift Markup ===================================
au BufNewFile,BufRead *.swift set filetype=swift
"============================== Set expandtab correctly =====================
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endif

"===================== Visual mode remappings ===============================
vnoremap < <gv
vnoremap > >gv
vnoremap : :s/\%V

"============================= FZF bindings =================================
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Ag<CR>
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"=========================== Easy split window navigation ===================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"================================ Turn Swap files off =======================
set noswapfile
set nobackup
set nowb

"===================================== Scrolling ============================
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"==================== Automatically reload .vimrc when saved ================
au BufWritePost .nvimrc so ~/.nvimrc

"==============================  leader shortcuts ===========================
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<enter>
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>c <C-w>c
nnoremap <leader>q <C-w>q
nnoremap <leader>t :tabnew<enter>
nnoremap <leader>w :w<enter>
nnoremap <leader>l :BuffergatorMruCycleNext<CR>
nnoremap <leader>h :BuffergatorMruCyclePrev<CR>
nnoremap <leader>gp <Plug>GitGutterPreviewHunk
nnoremap <leader>gu <Plug>GitGutterUndoHunk
nnoremap <leader>gs <Plug>GitGutterStageHunk
nnoremap <leader>T <C-w>T:NERDTree<enter>
nnoremap <silent> <leader>gd :Gdiff :0<enter>
nnoremap <silent> <leader>gw :Gw <enter>
nnoremap <silent> <leader>gst :Gst <enter>

" Set language server bindings
nnoremap <silent> <leader>j :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>a :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <leader>e :call LanguageClient#explainErrorAtPoint()<CR>

"============================ Use Tab for auto completion ===================
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>
"=================================== Colourscheme ===========================
set background=dark
let g:onedark_terminal_italics=1
colorscheme onedark
"================================== Remap Esc Key ===========================
imap jk <Esc>
"============================= Fix Backspace ================================
set backspace=2
"============================ Airline Config ================================
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1 "git clone git@github.com:powerline/fonts.git
                                  "./install.sh
let g:airline_theme='onedark'
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"
"========================  Enter insert mode terminals ======================
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
