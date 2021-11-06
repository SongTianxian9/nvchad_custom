vim.cmd([[
" height current line
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" line
set textwidth=80
set wrapmargin=0
set formatoptions+=t
set lbr " line break
set scrolloff=10

" Turn backup off
set nobackup
set nowb
set noswapfile

" misc
let maplocalleader = ';'
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set cmdheight=2
set lazyredraw
set autochdir
set hidden " allow auto-hiding of edited buffers
set laststatus=2

"spell check
" setlocal spell
" -- set spelllang=en_us,cjk
" -- inoremap <C-n> <c-g>u<Esc>[s1z=`]a<c-g>u

"runtimepath"
set runtimepath+=~/.config/nvim/lua/custom
]])
