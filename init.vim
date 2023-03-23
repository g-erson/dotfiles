
call plug#begin('~/.vim/plugged')

if exists('g:gui_oni')
  " Onivim does all the below stuff itself, best leave it alone
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
else 
  Plug 'nvim-lualine/lualine.nvim'
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  Plug 'maxmellon/vim-jsx-pretty'

  " Async autocompletion
  " Completion from other opened files
  Plug 'Shougo/context_filetype.vim'

  " Table mode
  Plug 'dhruvasagar/vim-table-mode'
  let g:table_mode_corner_corner='+'
  let g:table_mode_header_fillchar='='

  if has('mouse')
    set mouse=a
  endif

endif

Plug 'jeetsukumaran/vim-buffergator'
Plug 'MunifTanjim/nui.nvim'
"Plug 'folke/noice.nvim' --super slow
"Plug 'rcarriga/nvim-notify' --really slow
Plug 'smjonas/inc-rename.nvim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'frigoeu/psc-ide-vim'
Plug 'posva/vim-vue'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'amadeus/vim-mjml'
Plug 'gmoe/vim-faust'
Plug 'akinsho/git-conflict.nvim'
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/neural'
Plug 'neovimhaskell/haskell-vim'
Plug 'HerringtonDarkholme/yats'
Plug 'StanAngeloff/php.vim'
call plug#end()

set completeopt=menu,menuone,noselect
set fillchars=vert:\ 

"================================= inc-rename ===============================
nnoremap <leader>R :IncRename 
"===================================== Gitgutter ============================
let g:gitgutter_realtime = 1
set updatetime=250
"=========================== Visual Search Text =============================
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"================= Decrease time waiting between keypresses  ================
set timeoutlen=800 
"=========================== Oops forgot sudo ===============================
cmap w!! w !sudo tee > /dev/null %
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
"============================ Increase redrawtime  ==========================
set redrawtime=10000
set nofixendofline
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
"============================= Nvim Tree ====================================
lua <<EOF
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require("nvim-tree").setup()
EOF
"============================= FZF bindings =================================
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"let $FZF_DEFAULT_COMMAND = 'ag -l --ignore node_modules -g ""'
"nnoremap <C-b> :Buffers<CR>
"nnoremap <C-p> :FZF<CR>
"nnoremap <C-f> :Ag<CR>
"let g:fzf_buffers_jump = 1
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-s': 'split',
"  \ 'ctrl-v': 'vsplit' }
"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> se" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>t laststatus=2 showmode ruler
lua <<EOF
  require("inc_rename").setup()
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
      }
    }
  }
  require('telescope').load_extension('fzf')
EOF
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
nnoremap <leader>n :NvimTreeToggle<enter>
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>c <C-w>c
nnoremap <leader>q <C-w>q
nnoremap <leader>t :tabnew<enter>
nnoremap <leader>w :w<enter>
nnoremap <leader>l :BuffergatorMruCycleNext<CR>
nnoremap <leader>h :BuffergatorMruCyclePrev<CR>
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
"nnoremap <leader>gs <Plug>GitGutterStageHunk
nnoremap <leader>T <C-w>T:NvimTreeFocus<enter>
nnoremap <silent> <leader>gd :Git diff :0<enter>
nnoremap <silent> <leader>gb :Git blame <enter>
nnoremap <silent> <leader>gw :Gw <enter>
nnoremap <silent> <leader>gs :Git <enter>
"================================= Neural AI ============================
let g:neural = {
\   'source': {
\       'openai': {
\           'api_key': $OPENAI_API_KEY,
\       },
\   },
\}

"================================= LSP ==================================
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local nvim_lsp = require('lspconfig')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', ',ka', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'grf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', ',d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', ',f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'tsserver', 'intelephense', 'hls', 'eslint' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

EOF
"=================================== Colourscheme ===========================
set background=dark
lua <<EOF
  require('onedark').setup {
    style = 'cool',
    colors = {
      bg0 = "#212A3B",    -- define a new color
    },
  }
  require('onedark').load()
EOF
"================================== Remap Esc Key ===========================
imap jk <Esc>
"============================= Fix Backspace ================================
set backspace=2
"============================ LuaLine Config ================================
lua << END
  require('lualine').setup {
    options = {
      theme = 'onedark',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = { 'fileformat' },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  }
END
"========================  Enter insert mode terminals ======================
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
"======================  Indent 4 spaces for PHP... :( ======================
autocmd FileType php setlocal shiftwidth=4 tabstop=4
