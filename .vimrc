call plug#begin('~/.vim/plugged/')
    " General
	Plug 'vim-scripts/indentpython.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'tmhedberg/SimpylFold'
    Plug 'Shougo/echodoc.vim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    "Plug 'ervandew/supertab'
	Plug 'Raimondi/delimitMate'
    Plug 'alvan/vim-closetag'

    " Syntax/Highlighting
    Plug 'sheerun/vim-polyglot'
    Plug 'yuezk/vim-js'
    Plug 'lervag/vimtex'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'elzr/vim-json'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'pangloss/vim-javascript'

    " Linting
	Plug 'nvie/vim-flake8'

    " Completion 
	"Plug 'Valloric/YouCompleteMe' " too heavy
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "too slow
    "Plug 'zchee/deoplete-jedi' "too slow
	"Plug 'davidhalter/jedi-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Snippets, mostly for React 
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'mlaursen/vim-react-snippets'


call plug#end()

set mouse=a
set statusline^=%{coc#status()}
" set wrap linebreak nolist

" Buffer configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Window splitting 
set splitbelow
set splitright

" Syntax Highlighting
let python_highlight_all=1
syntax on
set nospell

" Terminal true colors
if (has("termguicolors"))
    set termguicolors
endif

" Python PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Python Provider
let g:python3_host_prog = '/usr/local/opt/python/bin/python3.7'

" julia
let g:default_julia_version = '1.0'

" UTF-8 Support
set encoding=utf-8

" Fix weird backspace behaviour
set bs=2

" Deoplete 
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 0
"let g:deoplete#max_list = 20
"let g:deoplete#sources#jedi#enable_type_info = 0
"let g:deoplete#sources#jedi#show_docstring = 1

" echodoc.vim
set cmdheight=2
let g:echodoc#enable_at_startup = 1

" Disable jedi-vim completions in favour of deoplete-jedi's
"let g:jedi#completions_enabled = 0

" Snippet completion
let g:UltiSnipsExpandTrigger="<tab>"

" Syntastic Configurations
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>>'
highlight SyntasticError guibg=#960018
highlight SyntasticWarning guibg=#DAA520

" Semshi Configurations
let g:semshi#always_update_all_highlights = 1

" Nerdtree Configurations
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeMouseMode=3 

"Completion Customizations
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_semantic_triggers = {
"	\   'python': [ 're!\w{1}' ]
"	\ }
let g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt=longest,menuone
set completeopt-=preview
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Navigating completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Line Numbers
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Tag closing configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" Automatically Close Brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set autoindent
set smartindent


" Don't wrap lines
set formatoptions-=t
set nowrap

" wrap .tex files
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal wrap linebreak nolist
    autocmd FileType txt setlocal wrap linebreak nolist
augroup END

" Enable incrementing letters
set nrformats+=alpha

" Crontab vim fix
autocmd FileType crontab setlocal nobackup nowritebackup

" Transaction file processing
function! Process()
	:%s/T.*Z//g
	:%s/-/,/g
	:%s/date/year,month,day/g
endfunction

" Theming
set background=dark
colorscheme one


" Rehighlight Semshi after colorscheme change
function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#5fafff
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
    hi semshiAttribute       ctermfg=49  guifg=#00ffaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
endfunction

autocmd ColorScheme * call MyCustomHighlights()

