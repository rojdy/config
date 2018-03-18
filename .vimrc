
" -----------
" Vim Config
" -----------
set clipboard=unnamedplus
set mouse=a
set number
set laststatus=2 
set scrolloff=10                      " Start scrolling three lines before the horizontal window border
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Show “invisible” characters
set tags=tags;/                       " Look for tags file up on file hierarchy
set tabstop=2                         " show existing tab with 4 spaces width
set shiftwidth=2                      " when indenting with '>', use 4 spaces width
set expandtab                         " On pressing tab, insert 4 spaces
set hlsearch
set smartindent

" -----------
" Mapping
" -----------

" Set leader
let mapleader = "," 
let g:mapleader = ","

" Fix cut/delete/paste
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

vnoremap x "_x
vnoremap d "_d
vnoremap D "_D

nnoremap <Leader>d "+d
nnoremap <Leader>D ""D
vnoremap <Leader>d "+d

vnoremap p "_dP

" Change tab
map L gt
map H gT
map <S-Right> gt
map <S-Left> gt

" -----------
" Plug
" -----------
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chrisbra/Colorizer'
Plug 'Valloric/YouCompleteMe', { 'for': ['html', 'javascript', 'python', 'scala'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
call plug#end()

" -----------
" Plugin mapping/config
" -----------

" Ctags
map <leader>l <C-T>
map <leader>m <C-]>
map <leader><S-c> :!ctags -R --exclude=@.ctagsignore .

" TagBar Plugin
nmap <leader>tr :TagbarToggle<CR>

" YouCompleteMe Plugin
map <leader>gg :YcmCompleter GoTo<cr>
map <leader>gd :YcmCompleter GoToDefinition<cr>
map <leader>gr :YcmCompleter GoToReferences<cr>
map <leader>rr :YcmCompleter RefactorRename<cr>

" FZF Plugin
map <leader>f :FZF<cr>

" Nerd TREE Plugin
map <leader>t :NERDTreeFind<cr>
"map <leader>t :NERDTreeToggle<cr>

" FuzzyFinder Plugin
let g:fuf_modesDisable = []
let g:fzf_layout = { 'left': '~40%' }

" Lint Engine (Ale)
let g:ale_linters = {
\   'javascript': ['eslint','flow']
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" -----------
" SCROLLING | SEARCH
" -----------
" Use ag instead of grep
set grepprg=ag\ --nogroup\ --nocolor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

