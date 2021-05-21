syntax on
syntax enable
filetype on
filetype plugin indent on

lua << EOF
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local map_key = vim.api.nvim_set_keymap

local function set(opt, v, scopes)
  scopes = scopes or {o}
  for _, s in ipairs(scopes) do s[opt] = v end
end

local function autocmd(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = {cmds} end
  cmd('augroup ' .. group)
  if clear then cmd [[au!]] end
  for _, c in ipairs(cmds) do cmd('autocmd ' .. c) end
  cmd [[augroup END]]
end

local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then modes = {modes} end
  for _, mode in ipairs(modes) do map_key(mode, lhs, rhs, opts) end
end

-- Leader key
g.mapleader = [[ ]]

-- Color scheme
set('background', 'dark')
set('termguicolors', true)
cmd[[colorscheme tokyonight]]

-- Settings
local buffer = {o, bo}
local window = {o, wo}
set('langmenu', 'zh_CN.UTF-8')
set('helplang', 'cn')
set('encoding', 'utf-8')
set('fencs', 'utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936')
set('hidden', true)
set('wildmenu', true)
set('hlsearch', true)
set('incsearch', true)
set('matchtime', 1)
set('showmatch', true)
set('updatetime', 300)
set('ignorecase', true)
set('smarttab', true)
set('expandtab', true)
set('laststatus', 2)
set('showcmd', true)
set('ruler', true)
set('history', 300)
set('backup', false)
set('swapfile', false)
set('foldenable', false)
set('autoread', true)
set('autowrite', true)
set('mouse', 'a')

set('number', true, window)
set('cursorline', true, window)
set('cursorcolumn', true, window)

set('textwidth', 120, buffer)
set('smartindent', true, buffer)
set('autoindent', true, buffer)
set('cindent', true, buffer)
set('shiftwidth', 4, buffer)
set('softtabstop', 4, buffer)
set('tabstop', 4, buffer)

-- Auto commands
-- autocmd('', [[InsertLeave * se nocul]], true)
-- autocmd('', [[InsertEnter * se cul]], true)

-- Key bindings
map('', '<c-a>', 'ggVG$"+y')
map('v', '<c-c>', '"+y')
map('n', '<tab>', 'V')
map('n', '<s-tab>', 'V<')
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')

-- NVIM Treesitter
require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
set('foldmethod', 'expr')
set('foldexpr', 'nvim_treesitter#foldexpr()')

-- NVIM Web Devicons
require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 default = true;
}

-- NVIM Bufferline
require("bufferline").setup{
  options = {
    show_buffer_icons = true,
	indicator_icon = '▎',
	show_close_icon = false
  }
}
map('', '<leader><tab>', ':BufferLineCycleNext<CR>')
EOF

let g:dracula_italic = 0

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType go setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=120 noexpandtab
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType javascript,javascript.jsx,javascriptreact,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" TAGBAR
let g:tagbar_left = 0
let g:tagbar_autofocus = 1

" EASYMOTION
let g:EasyMotion_smartcase = 1

map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)

" ALE
let g:ale_linters = {
\   'python': ['flake8'],
\   'jsx': ['stylelint', 'eslint'],
\   'go': ['gopls'],
\}
let g:ale_enabled = 0
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" RUST.VIM
let g:rustfmt_autosave = 1

" CTAGS
set tags=./tags;/

" ARTLINE
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_alt_sep = '❯'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.branch = '⎇'
let g:airline#extensions#tabline#enabled = 0

" INDENTLINE
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
autocmd FileType json,markdown let g:indentLine_conceallevel=0

" NERDCOMMENTER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" COC
let g:coc_global_extensions = [
    \ "coc-json", "coc-pyright", "coc-go", "coc-tsserver",
    \ "coc-yank", "coc-explorer", "coc-git", "coc-pairs",
    \ "coc-yaml", "coc-highlight", "coc-tabnine"]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <c-e> <Plug>(coc-diagnostic-next)
" nmap <silent> <c-E> <Plug>(coc-diagnostic-prev)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> <C-h> :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! VSplitIfNotOpen(...)
    let cursorCmd = ''
    let fname = a:1
    if a:0 == 2  " Two arguments.
        let cursorCmd = a:1
        let fname = a:2
    endif
    if fname != fnamemodify(expand('%'), ':p:~:.')
        exec 'vsplit '.fname
    endif
    if len(cursorCmd)
        exec cursorCmd
    endif
endfunction

command! -nargs=+ CocVSplitIfNotOpen :call VSplitIfNotOpen(<f-args>)

autocmd VimEnter * CocCommand explorer --no-focus --width=30
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nnoremap <leader>e :CocCommand explorer --no-focus --width=30<cr>

" FLOATERM
let g:floaterm_autoclose = 2
let g:floaterm_autohide = v:false
let g:floaterm_height = 0.3
let g:floaterm_position = 'bottomright'
let g:floaterm_keymap_toggle = '<c-t>'

nnoremap <leader>r V:FloatermSend<CR>:FloatermToggle<CR>
vnoremap <leader>r :FloatermSend<CR>:FloatermToggle<CR>

" tnoremap <silent> <Esc><Esc> <C-\><C-n>
" inoremap <silent> <Esc> <C-\><C-n>
if !has('nvim')
    tnoremap <silent> <C-w> <C-w>.
endif

nnoremap <c-q> <C-\><C-n>:FloatermKill<cr>
tnoremap <c-q> <C-\><C-n>:FloatermKill<cr>

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files<cr>
nnoremap <leader>f :Ag<cr>
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': {'height': 0.4, 'width': 0.6} }
