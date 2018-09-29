filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
if exists('g:gui_oni')
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
else 
  " Statements here
  Plugin 'Valloric/YouCompleteMe' "This is just the client. Install server
                                  "with ./<plugin location>/install.sh
                                  " --clang-completer
                                  "
  Plugin 'jistr/vim-nerdtree-tabs'
  set runtimepath^=~/.vim/bundle/ctrlp.vim

  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'ctrlpvim/ctrlp.vim'

  "" Ignore some folders and files for CtrlP indexing
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|vendor\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
endif

Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-rails'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'peterhoeg/vim-qml'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'purescript-contrib/purescript-vim'
Plugin 'frigoeu/psc-ide-vim'
Plugin 'guns/vim-clojure-static'
Plugin 'posva/vim-vue'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

call vundle#end()
filetype plugin indent on     " required
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
"=========================== Set 24 bit colour ==============================
let NVIM_TUI_ENABLE_TRUE_COLOR=1
"============================== Sets Line Numbering on ======================
set nu
set relativenumber
"============================== Sets colour syntax on =======================
syn on!
"============================ Sets indentation correctly ====================
set autoindent
set smartindent
set shiftround
"============================ Vue file fancy markup =========================
let g:vue_disable_pre_processors = 1
au BufNewFile,BufRead *.vue set filetype=vue
"=========================== Purescript Markup ==============================
au BufNewFile,BufRead *.psc set filetype=purescript
au BufNewFile,BufRead *.purs set filetype=purescript
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

"===================== Reselect visual block after indent/outdent ===========
vnoremap < <gv
vnoremap > >gv

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
nnoremap <leader>n :NERDTreeTabsToggle<enter>
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>c <C-w>c
nnoremap <leader>q <C-w>q
nnoremap <leader>T <C-w>T:NERDTree<enter>

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
colorscheme solarized
"================================== Remap Esc Key ===========================
imap jk <Esc>
"============================= Set Clipboard to Sys Clipboard ===============
set clipboard=unnamed
"============================= Fix Backspace ================================
set backspace=2
"=================================== Detect QML Syntax ======================
au BufNewFile,BufRead *.qml set filetype=qml
"============================ Airline Config ================================
let g:airline_powerline_fonts = 1 "git clone git@github.com:powerline/fonts.git
                                  "./install.sh
let g:airline_theme = 'durant'
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"
"========================  Enter insert mode terminals ======================
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
