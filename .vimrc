
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
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Only use deoplete on the terminal 
  let g:deoplete#enable_at_startup = 1

  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  " Use release branch (Recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
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
set nowritebackup
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
"nnoremap <silent> <leader>j :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
"nnoremap <silent> <leader>a :call LanguageClient#textDocument_codeAction()<CR>
"nnoremap <silent> <leader>e :call LanguageClient#explainErrorAtPoint()<CR>

" =================================  Coc.nvim  ====================================== 
"
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
