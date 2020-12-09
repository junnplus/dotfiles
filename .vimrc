syntax on
syntax enable

if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " enable true color
    set termguicolors
endif

packadd! dracula
" set termguicolors
let g:dracula_italic = 0
set background=dark
" colorscheme solarized
colorscheme dracula

set nu
set cul
set cuc
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set langmenu=zh_CN.UTF-8
set helplang=cn

set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,utf-8,cp936

set hlsearch
set incsearch 
set showmatch 
set ignorecase
set matchtime=1
set backspace=2

set ai
set si
set autoindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set hidden
set wildmenu

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType go setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=120 noexpandtab
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType javascript,javascript.jsx,javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]

set showcmd
set cmdheight=2
set updatetime=300
set ruler
set history=300
set formatoptions=tcrqn
set nobackup
set noswapfile
set autowrite
set foldmethod=indent
set nofoldenable
set mouse=a

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!bash %
    endif
endfunc

map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

set completeopt=preview,menu
filetype on
filetype plugin indent on

map <C-A> ggVG$"+y
vmap <C-c> "+y

" 缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let mapleader = "\<space>"

" NERD TREE
" autocmd vimenter * NERDTree | wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinPos = "left"

" TAGBAR
" map <C-m> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_autofocus = 1

" EASYMOTION
let g:EasyMotion_smartcase = 1
let g:EasyMotion_leader_key = '<Space>'

map <Space>l <Plug>(easymotion-lineforward)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>h <Plug>(easymotion-linebackward)
map <Space>w <Plug>(easymotion-w)
map <Space>b <Plug>(easymotion-b)

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
let g:airline#extensions#tabline#enabled = 1

" VIM-GO
" autocmd FileType go nmap <c-j> <Plug>(go-def-vertical)
" let g:go_def_mapping_enabled = 0 " fuck vim-go default def mapping
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

" JAVASCRIPT
" let g:javascript_plugin_flow = 1

" INDENTLINE
let g:indentLine_conceallevel=1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" NERDCOMMENTER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" TERRAFORM
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" COC
let g:coc_global_extensions = ["coc-json", "coc-pyright", "coc-go", "coc-yank", "coc-explorer", "coc-git"]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <c-e> <Plug>(coc-diagnostic-next)
" nmap <silent> <c-E> <Plug>(coc-diagnostic-prev)

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
nnoremap <silent> K :call <SID>show_documentation()<CR>
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

map <C-m> :CocCommand explorer --no-focus --width=30<CR>
autocmd VimEnter * CocCommand explorer --no-focus --width=30
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

nnoremap <leader>r V:FloatermSend<CR>
vnoremap <leader>r :FloatermSend<CR>

" FLOATERM
let g:floaterm_autoclose = 2
let g:floaterm_autohide = v:false
let g:floaterm_height = 0.3
let g:floaterm_position = 'bottomright'
let g:floaterm_keymap_toggle = '<c-t>'
" tnoremap <silent> <Esc><Esc> <C-\><C-n>
" inoremap <silent> <Esc> <C-\><C-n>
if !has('nvim')
    tnoremap <silent> <C-w> <C-w>.
endif

nnoremap <c-j> :tabnext<cr>
nnoremap <c-k> :tabprevious<cr>

nnoremap <c-q> <C-\><C-n>:FloatermKill<cr>
nnoremap <c-h> <C-\><C-n>:FloatermHide!<cr>
tnoremap <c-q> <C-\><C-n>:FloatermKill<cr>
tnoremap <c-l> <C-\><C-n>:FloatermNew<cr>
tnoremap <c-h> <C-\><C-n>:FloatermHide!<cr>
tnoremap <c-j> <C-\><C-n>:FloatermNext<cr>
tnoremap <c-k> <C-\><C-n>:FloatermPrev<cr>

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files<cr>
nnoremap <leader>f :Ag<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': {'height': 0.4, 'width': 0.6} }
