
call plug#begin('~/.vim/plugged')

"if exists('g:neovide')
  set guifont=LigaNovaMonoforwithligatures\ Nerd\ Font:h15
  Plug 'folke/noice.nvim' "super slow
  Plug 'rcarriga/nvim-notify' "really slow
"endif 

Plug 'nanozuki/tabby.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tiagovla/scope.nvim'
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
let g:neovide_confirm_quit=1

if has('mouse')
  set mouse=a
endif

Plug 'MunifTanjim/nui.nvim'
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
Plug 'github/copilot.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-copilot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'amadeus/vim-mjml'
Plug 'gmoe/vim-faust'
Plug 'akinsho/git-conflict.nvim'
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/neural'
Plug 'neovimhaskell/haskell-vim'
Plug 'HerringtonDarkholme/yats'
Plug 'StanAngeloff/php.vim'
Plug 'gcmt/taboo.vim'
Plug 'nvim-orgmode/orgmode'
call plug#end()

set completeopt=menu,menuone,noselect
set fillchars=vert:\ 

"============================== Haskell highlighting ========================
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
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
"set redrawtime=10000 "Fixes syntax highlighing for large files
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

  local HEIGHT_RATIO = 0.8
  local WIDTH_RATIO = 0.5

  require('nvim-tree').setup({
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * WIDTH_RATIO
          local window_h = screen_h * HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2)
                          - vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
          end,
      },
      width = function()
        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
      end,
    },
  })
EOF
"============================= Telescope bindings =================================
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
  require("scope").setup({
      restore_state = false, -- experimental
  })
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
  require('telescope').load_extension('scope')
EOF
"=========================== Easy split window navigation ===================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-a><C-[> <C-\><C-n>
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
nnoremap <leader>st <C-w>s:terminal<CR>
nnoremap <leader>sv <C-w>v
nnoremap <leader>svt <C-w>v<C-w>l:terminal<CR>
nnoremap <leader>c <C-w>c
nnoremap <leader>q <C-w>q
nnoremap <leader>t :terminal<CR>
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>w :w<enter>
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
nnoremap <leader>bd :lclose<bar>b#<bar>bwipeout #<CR>
nnoremap <leader>md :Noice dismiss<CR>
"nnoremap <leader>gs <Plug>GitGutterStageHunk
nnoremap <leader>T <C-w>T:NvimTreeFocus<enter>
nnoremap <silent> <leader>gd :Git diff :0<enter>
nnoremap <silent> <leader>gb :Git blame <enter>
nnoremap <silent> <leader>gw :Gw <enter>
nnoremap <silent> <leader>gs :Telescope git_status <enter>
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
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
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
      { name = 'copilot' },
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
    buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', ',ka', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'grf', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    buf_set_keymap('n', ',d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', ',f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  end

  local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
  }
  vim.diagnostic.config {float = { border = "rounded" }}

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'tsserver', 'intelephense', 'hls', 'eslint' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

  nvim_lsp['clangd'].setup {
    cmd = vim.lsp.rpc.connect('127.0.0.1', 50505),
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    flags = {
      debounce_text_changes = 150,
    }
  }
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
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        }
      },
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
    extensions = {},
  }

--============================ Tabby bindings ==================================
  require('tabby.tabline').use_preset('active_wins_at_tail', {
    theme = {
      fill = 'TabLineFill', -- tabline background
      head = 'TabLine', -- head element highlight
      current_tab = 'TabLineSel', -- current tab label highlight
      tab = 'TabLine', -- other tab label highlight
      win = 'TabLine', -- window highlight
      tail = 'TabLine', -- tail element highlight
    },
    nerdfont = true, -- whether use nerdfont
    tab_name = {
        name_fallback = 'function({tabid}), return a string',
    },
    buf_name = {
        mode = "'unique'|'relative'|'tail'|'shorten'",
    },
  })

--============================ Orgmode ==================================

  -- Load custom treesitter grammar for org filetype
  require('orgmode').setup_ts_grammar()

  -- Treesitter configuration
  require('nvim-treesitter.configs').setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop,
    -- highlighting will fallback to default Vim syntax highlighting
    highlight = {
      enable = true,
      -- Required for spellcheck, some LaTex highlights and
      -- code block highlights that do not have ts grammar
      additional_vim_regex_highlighting = {'org'},
    },
    ensure_installed = {'org'}, -- Or run :TSUpdate org
  }

  require('orgmode').setup({
    org_agenda_files = {'~/org-mode/**/*'},
    org_default_notes_file = '~/org-mode/refile.org',
  })
END
"========================  Enter insert mode terminals ======================
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
"======================  Indent 4 spaces for PHP... :( ======================
autocmd FileType php setlocal shiftwidth=4 tabstop=4
"========================  Terminal background colours ======================
autocmd TermOpen * setlocal listchars= | set nocursorline | set nocursorcolumn
lua << END
  vim.api.nvim_set_hl(0, "FloatBorder", {bg="#232A39", fg="#4DBDCB"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg="#232A39"})
  vim.api.nvim_set_hl(0, "NvimTreeNormal", {bg="#232A39"})
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", {bg="#232A39"})
  vim.api.nvim_set_hl(0, "TermHighlight", {
    bg = "#1E2126",
    fg = "fg",
  })
  vim.api.nvim_create_augroup("_terminal", { clear = true })
  vim.api.nvim_create_autocmd(
    "TermOpen", 
    { command = "setlocal winhighlight=Normal:TermHighlight", group = "_terminal", }
  )
END
"========================  Setup Noice in Neovide ==========================
"if exists('g:neovide')
  lua require("noice").setup()
"endif
