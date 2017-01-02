" hello internet

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Sensible defaults.
Plugin 'tpope/vim-sensible'

" auto close tag
Plugin 'alvan/vim-closetag'

" Improved navigation between vim and tmux panes (C-h/C-j/C-k/C-l).
Plugin 'christoomey/vim-tmux-navigator'

" NERDTree file tre
" https://github.com/scrooloose/nerdtreee
Plugin 'scrooloose/nerdtree'

" use ctrl-p to quickly search files
" http://ctrlpvim.github.io/
Plugin 'kien/ctrlp.vim'

" easy surrounding of elements. 
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" colours!
" https://github.com/nanotech/jellybeans.vim
Plugin 'nanotech/jellybeans.vim'

" great bottom status bar
" https://github.com/itchyny/lightline.vim
Plugin 'itchyny/lightline.vim'

" neocomplete
" https://github.com/Shougo/neocomplete.vim
Plugin 'Shougo/neocomplete.vim'

" tab completion
" https://github.com/ervandrew/supertab
Plugin 'ervandew/supertab'

" some JS language niceties
" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'

" helps us align text etc
" https://github.com/godlygeek/tabular
Plugin 'godlygeek/tabular'

" jsx language highlighting
" https://github.com/mxw/vim-jsx
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" rebind NERDTree to ctrl-g toggle
:nnoremap <C-g> :NERDTreeToggle<CR>

"right arrow opens NERD node
let NERDTreeMapActivateNode='<right>'

" display hidden NERDTree files
let NERDTreeShowHidden=1

" filter garbage out of tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" make numbers visible in the gutter
set number

" assign our leader button to spacebar for convenience
let mapleader=" "

" lets us jump around files better without saving
set hidden

" increase command history
set history=100

" enable syntax highlighting
syntax on

" make lightline appear by default
set laststatus=2

" formatting shenanigans
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" improve backspace behavior
set backspace=indent,eol,start

" show matching parens
set showmatch

" enable our colourscheme
colorscheme jellybeans


" here goes tons of autocomplete stuff
"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
