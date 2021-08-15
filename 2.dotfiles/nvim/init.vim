"================================================
" init.vim - initialize config
"
" Author: Shiki
" Email: chengtao.yao@outlook.com
" Last Modified: 2021-08-12
"================================================
"
" command! -nargs=1 LoadScript exec 'source '.'./scripts/'.<args>
command! -nargs=1 LoadScript exec 'source '.'~/.config/nvim/scripts/'.<args>

" Load basic configuration script
LoadScript '1.basic.vim'

" Load plugin script
LoadScript '2.plugin.vim'

" Load theme script
LoadScript '3.theme.vim'

