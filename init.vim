syntax on

set nohlsearch
set guicursor=
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set relativenumber
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=18
set signcolumn=yes

let mapleader = " "
nnoremap <leader>q :q<CR><CR>
nnoremap <leader>w :w<CR><CR>
nnoremap <leader>nt :NERDTree<CR><CR>
nnoremap <F5> :UndotreeToggle<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"vnoremap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
vnoremap <leader>p <Plug>(coc-format-selected)
"change surround
"surround word
nmap <silent> tt ysiw 
"change surround
nmap <silent> ññ cs 
nnoremap ,b :ls<CR>:buffer<Space>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
nmap <silent> gd <Plug>(coc-definition)
imap jk <Esc>
"imap <expr> <tab> emmet#expandAbbrIntelligent("/<tab>")
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>

call plug#begin('~/.vim/plugged')

" sintax highlight
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" theme
Plug 'mhartington/oceanic-next'
" fuzzy finder
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" auto-close brackets
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" terminal style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" post install (yarn install | npm install) then load plugin only for editing supported files
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" for easy comments
Plug 'preservim/nerdcommenter'
" html close tag
Plug 'alvan/vim-closetag'
" highlight html closing tag
Plug 'valloric/MatchTagAlways'
" emmet
Plug 'mattn/emmet-vim'
" tmux 
Plug 'christoomey/vim-tmux-navigator'
" nerdtree
Plug 'preservim/nerdtree'
" undotree
Plug 'mbbill/undotree'
" bracey - live html, css & js
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
"c# plugin
Plug 'OmniSharp/omnisharp-vim'

call plug#end()

"c# use mono instaled version
let g:OmniSharp_server_use_mono = 1

"emmet remap
let g:user_emmet_leader_key='<leader>c'

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_template_tags = ['html', 'jsx']

" bracey config
let g:bracey_auto_start_browser = 1

" fuzzy finder config
" ctrlp plugin
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(node_modules|git|hg|svn)$'}

" airline theme
"let g:airline_theme='deus'
let g:airline_theme='oceanicnext'

" theme
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE

" Coc plugin
let g:coc_global_extension = [ 'coc-server', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-emmet', 'coc-pyright' ]
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"Coc-prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile
