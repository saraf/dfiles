set number
set hlsearch
:set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')
    
    " Multiple Plug commands can be written in a single line using | separators
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' 
    
    Plug 'jiangmiao/auto-pairs'
    
    "--------------- these ones are for auto commenting and formatting
    Plug 'scrooloose/nerdcommenter' 
    Plug 'terryma/vim-multiple-cursors'
    Plug 'chiel92/vim-autoformat'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'

"--------------- these are for integration with git
    Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

"-------------------- this one is for auto generating doxygen
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'MattesGroeger/vim-bookmarks'

    
    " On-demand loading - these we do not really need
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-sensible',  { 'on':  'SENSIBLEToggle' }
    Plug 'tpope/vim-commentary'
    
    " Plugin outside ~/.vim/plugged with post-update hook
    "------------------- this one is a really nice command line autocompleter - useful outside vim
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    
    " Initialize plugin system
    call plug#end()
    
    let g:ycm_global_ycm_extra_conf = "/home/aalhad/.vim/pack/dist/start/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_max_diagnostics_to_display = 0
    nnoremap gb ^d0i│ <esc>A │<esc>YPVjr─p+r└$r┘2-r┌$r┐:,+2Commentary<CR>=2jj

    " Underline the current line with dashes in normal mode
nnoremap <F5> yyp<c-v>$r-

" Underline the current line with dashes in insert mode
inoremap <F5> <Esc>yyp<c-v>$r-A

function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

cmap w!! w !sudo tee > /dev/null %
