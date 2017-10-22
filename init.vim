"(TODO)
"something to comment things
"some git framework
"the 'b' prefix
"the 'w' prefix
"build tool
"easy way to quit terminal

function SetTab()
	set noexpandtab
	set tabstop=4
	set shiftwidth=0
endfunction

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/denite.nvim'

" coding
Plug 'roxma/nvim-completion-manager'
Plug 'autozimu/LanguageClient-neovim', {'do': 'UpdateRemotePlugins'}
Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/deoplete.nvim' not needed with languageclient
" Plug 'Ale'

" usability
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate' " insert mode helper?
Plug 'sheerun/vim-polyglot' " language pack

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'hecal3/vim-leader-guide'

" general ones
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" call dein#add('majutsushi/tagbar')
" call dein#add('Shougo/deol.nvim')
call plug#end()

"general vim settings
let mapleader = "\<space>"
set timeoutlen=1000 ttimeoutlen=0
set hidden " also needed for languageclient
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set clipboard+=unnamedplus
" set updatetime=250
" set wildmode=longest,list,full
" set wildmenu
set splitbelow
set splitright
set mouse=a
set number
set relativenumber

"color scheme
set termguicolors
colorscheme NeoSolarized
"NERDTree
let NERDTreeWinPos = 'right'
let NERDTreeAutoCenter = 1
let NERDTreeAutoCenterThreshold = 3
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeShowBookmarks = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
highlight SyntasticWarningSign guibg=#eee8d5 guifg=orange
highlight SyntasticErrorSign guibg=#eee8d5 guifg=red
highlight SyntasticStyleWarningSign guibg=#eee8d5 guifg=grey
highlight SyntasticStlyeErrorSign guibg=#eee8d5 guifg=red
"other plugins
let g:airline_powerline_fonts = 1
let g:gitgutter_map_keys = 0
let g:LanguageClient_autoStart = 1
"let g:deoplete#enable_at_startup=1
"set completeopt+=noinsert
let g:LanguageClient_serverCommands = {
  \ 'java' : ['nix-shell', '-p', 'openjdk', 'bash', '--run', 'bash ~/prog/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/wrapper.sh'],
  \ 'haskell' : ['hie', '--lsp', '-d', '-l', '~/hie.log']
  \ }

"general keybindings
"move splits from normal and terminal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>

" tnoremap <C-Space> <C-\><C-n><Space>
"move cursor in insert
inoremap <C-J> <C-O>j
inoremap <C-K> <C-O>k
inoremap <C-L> <C-O>l
inoremap <C-H> <C-O>h

" <leader> keybindings + vim leader guide
" TODO surround, languageClient, fzf, vimplug, git?, gitv?, terms
let g:lmap =  {}
nmap <leader><tab> <C-^>
let g:lmap.b = { 'name' : 'Buffer Menu'}
  let g:lmap.b.b = [ 'Buffers', 'search buffers']
let g:lmap.f = { 'name' : 'File Menu' }
  let g:lmap.f.a = ['wa', 'save all buffers']
  let g:lmap.f.e = { 'name' : 'Edit files' }
    let g:lmap.f.e.d = ['e $MYVIMRC', 'Open vimrc']
    let g:lmap.f.e.R = ['e $MYVIMRC', 'Reload vimrc']
  let g:lmap.f.f = ['Files', 'search in current dir']
  let g:lmap.f.s = ['w', 'save current buffer']
  let g:lmap.f.T = ['NERDTreeTabsToggle', 'Toggle global NERDTree']
  let g:lmap.f.t = ['NERDTreeFocus', 'Focus the NERDTree']
  let g:lmap.f.w = ['w', 'write current buffer']
  let g:lmap.f.W = ['w!', 'write current buffer!']
let g:lmap.g = { 'name' : 'Git' }
  let g:lmap.g.h = { 'name' : 'Hunk' }
    let g:lmap.g.h.n = ['next hunk', 'GitGutterNextHunk']
    let g:lmap.g.h.p = ['prev hunk', 'GitGutterPrevHunk']
    let g:lmap.g.h.s = ['stage hunk', 'GitGutterStageHunk']
    let g:lmap.g.h.u = ['stage hunk', 'GitGutterUndoHunk']
    let g:lmap.g.h.v = ['stage hunk', 'GitGutterPreviewHunk']
let g:lmap.l = { 'name' : 'lcp',
  \ 'd' : [':call LanguageClient_textDocument_definition()', 'definition'],
  \ 'a' : [':call LanguageClient_textDocument_codeAction()', 'fix action'],
  \ 'f' : [':call LanguageClient_textDocument_formatting()', 'format document'],
  \ 'i' : [':call LanguageClient_textDocument_hover()', 'info'],
  \ 'r' : [':call LanguageClient_textDocument_rename()', 'rename'],
  \ 's' : [':call LanguageClient_textDocument_documentSymbol()', 'top level symbols'],
  \ 'u' : [':call LanguageClient_textDocument_references()', 'references under cursor'],
  \ }
let g:lmap.t = { 'name' : 'Toggles'}
  let g:lmap.t.n = ['set number!', 'Toggle line numbers']
  let g:lmap.t.r = ['set relativenumber!', 'Toggle relative numbers']
let g:lmap.T = { 'name' : 'UI toggles'}
  let g:lmap.T.t = [':let &background = ( &background == "dark"? "light" : "dark")','toggle theme']
let g:lmap.q = { 'name' : 'Quit'}
  let g:lmap.q.q = [':qa', 'Quit']
  let g:lmap.q.Q = [':qa!', 'Quit!']
  let g:lmap.q.w = [':wqa', 'Write and quit']
  let g:lmap.q.W = [':wqa!', 'Write and quit!']
let g:lmap.x = { 'name' : 'Text'}
  let g:lmap.x.c = [':Commentary', 'toggle comment on this line']

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
tnoremap <silent> <c-space> <c-\><c-n>:<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
