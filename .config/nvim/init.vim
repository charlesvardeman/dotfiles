" New (neo)vim configuration
" August 2020
" Enspired by the following configurations:
" https://gist.githubusercontent.com/danielmiessler/3371fc10cc71ce84cdcbc755fb714fb4/raw/a4a49c2b8f2f38feb38516a0a940656122f59ca4/init.vim
" https://danielmiessler.com/blog/vim-configuration-update-2019-version/
" https://github.com/jamesaoverton/dotfiles/blob/master/.config/nvim/init.vim
" TODO:
" INSTALL TODO Mode
" Pyenv configuration
"

let s:minpac_dir = $HOME . '/.config/nvim/pack/minpac/opt/minpac'
if has('vim_starting')
  if !isdirectory(s:minpac_dir)
    echo "Install minpac ..."
    execute '!git clone --depth 1 https://github.com/k-takata/minpac ' . s:minpac_dir
  endif
endif

if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" Basic Configuration
"
" Remap Escape
inoremap jk <ESC>

" Remap the leader key to the spacebar
let mapleader = "'"

" Run commands with semicolon
nnoremap ; :

" Save the current buffer using the leader key
noremap <Leader>w :w<CR>

" Save and exit Vim using the leader key
noremap <Leader>e :wq<CR>

" Exit without saving using the leader key
noremap <Leader>q :q!<CR>

" Enable syntax highlighting
syntax on

" Set the shell
set shell=/usr/local/bin/zsh

" Clipboard functionality (paste from system)
vnoremap  <leader>y "+y
nnoremap  <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Don't use modelines
set nomodeline

" Don't complain about hiding modified buffers.
set hidden

" Spell Checking
set spelllang=en_us

" Backup and Undo
" set undodir=~/.local/share/nvim/undo
" set backupdir=~/.local/share/nvim/backup
" set undolevels=1000

" Wrap Lines
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set scrolloff=3 " minimum lines to keep above and below cursor

" Searching
set ignorecase
set smartcase

" Indentation
set shiftwidth=2
set softtabstop=2
set expandtab

" Folding
if has('folding')
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif


" GUI
set guioptions="cegmt"
set termguicolors
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff100-blinkon999-Cursor/lCursor
if !has("nvim") && !empty($TMUX)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" ----------------------------------------------------------------------
" Colorscheme Settings
" ----------------------------------------------------------------------
nnoremap cyi :colorscheme yin<CR>
nnoremap cya :colorscheme yang<CR>
nnoremap cv :colorscheme vimalayas<CR>

colorscheme yang

packadd minpac

if !exists('*minpac#init')
  " minpac is not available.

  " Settings for plugin-less environment.
  " ...
else
call minpac#init()
" Managed plugins (automatically installed and updated via "Pu" and "Pc")
call minpac#add('k-takata/minpac', {'type': 'opt'})



" General
call minpac#add( 'tpope/vim-sensible')           " sensible defaults
call minpac#add( 'tpope/vim-repeat')              " better command repeating
call minpac#add( 'tpope/vim-surround')           " surround text with stuff
call minpac#add( 'tpope/vim-unimpaired')          " navigation mappings
call minpac#add( 'editorconfig/editorconfig-vim') " respect .editorconfig files
call minpac#add( 'ctrlpvim/ctrlp.vim')            " fuzzy file and buffer search
call minpac#add( 'moll/vim-bbye')                 " better buffer controls
call minpac#add( 'kshenoy/vim-signature')         " show marks in signs column

" Version Control
call minpac#add( 'tpope/vim-fugitive')            " git integration
call minpac#add( 'airblade/vim-gitgutter')        " git status


call minpac#add('junegunn/fzf', {'do': {-> system('./install --all')}})
call minpac#add('junegunn/fzf.vim')
call minpac#add('nathanaelkane/vim-indent-guides')

" Configuration for colorschemes
call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
call minpac#add('arcticicestudio/nord-vim', {'type': 'opt'})
call minpac#add('pgdouyon/vim-yin-yang', {'type':'opt'})
call minpac#add('pgdouyon/vim-alayas', {'type':'opt'})
call minpac#add('sainnhe/lightline_foobar.vim')
call minpac#add('itchyny/lightline.vim')

 " Filetypes
call minpac#add( 'neapel/vim-n3-syntax')         " rdf, turtle, etc.  

command! Pu call minpac#update()
command! Pc call minpac#clean()
endif 

"" ADDITIONAL CONFIGURATION

" Spelling
nnoremap <leader>sp :set spell<CR>
nnoremap <leader>s ]s
nnoremap <leader>f 1z=

" Line numbers
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>

" Clear highlighting
nnoremap <leader>c :nohl<CR>

" Paste mode
nnoremap <leader>pa :set nopaste!<CR>

" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


inoremap <c-j> <esc><c-w>w
inoremap <c-space> <space>

nnoremap <c-e> :Eval<cr>
nnoremap <c-j> <c-w>w
nnoremap <c-k> :CtrlPBuffer<cr>
nnoremap <leader>1 :only<cr>
nnoremap <leader>2 :only<cr>:vsplit<cr>:b#<cr>
nnoremap <leader>3 :only<cr>:vsplit<cr>:b1<cr>:split<cr>:b#<cr>
nnoremap <leader>c :b1<cr>
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>j :call SetGlobalJournalMarks()<cr>
nnoremap <leader>k :b#<cr>
nnoremap <leader>m :setf markdown<cr>
" nnoremap <leader>p :set paste!<cr>
nnoremap <leader>q :Bwipeout<cr>
nnoremap <leader>r :w<cr>:Require!<cr>
nnoremap <leader>s :call ToggleSignColumn()<cr>
nnoremap <leader>t :call RunCommand()<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>d 0rX<esc>j
" nnoremap <leader>y :source ~/.config/nvim/init.vim<cr>

tnoremap <c-j> <c-\><c-n><c-w>w
tnoremap <esc> <c-\><c-n>



" Kill the arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>

" Configuration for color schemes
"
"
set termguicolors     " enable true colors support
" themes

let g:lightline_foobar_bold = 1
 let g:lightline = {
      \ 'colorscheme': 'default'
      \ }


" # Plugin Config
"
" Remaining pluging configuration.
" Same order as plugin section.

" vim-gitgutter
" https://github.com/airblade/vim-gitgutter
set signcolumn=yes

" CtrlP fuzzy file searching
" https://github.com/ctrlp/ctrlp.vim
" http://blog.patspam.com/2014/super-fast-ctrlp
let g:ctrlp_switch_buffer = ''
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore .vagrant
  \ --ignore .local
  \ --ignore "**/*.pyc"
  \ -g ""'


" Get the visual selection
" Why is this not a built-in Vim script function?!
" https://stackoverflow.com/a/6271254
function! s:get_visual_selection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction



" Toggle the sign column
function! ToggleSignColumn()
  if &signcolumn == 'yes'
    set signcolumn=no
  else
    set signcolumn=yes
  endif
endfunction


" Terminals
autocmd TermOpen * setlocal nospell

" Text files
autocmd BufRead,BufNewFile *.{txt,tex,md,mdown,mkd,mkdn,markdown,mdwn} setlocal spell

" Makefiles
autocmd FileType make setlocal list noexpandtab tabstop=4 shiftwidth=4 softtabstop=0

" Turtle files
autocmd BufNewFile,BufRead *.ttl setlocal filetype=n3
