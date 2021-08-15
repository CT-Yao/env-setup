"================================================
" theme.vim
" Author: Chengtao Yao
" Email: chengtao.yao@outlook.com
" Last Modified:2021-0814
"================================================

"------------------------------------------------
" 1. Theme Settings (edge theme)
"------------------------------------------------

set termguicolors
colorscheme edge

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_commit = 1
let g:lightline = {'colorscheme' : 'edge'}
let g:edge_better_performance = 1

"------------------------------------------------
" 2. Airline Configuration
"------------------------------------------------

" Airline theme
let g:airline_theme='bubblegum'
"let g:airline_theme = 'edge'

" Unicode symbols for customizing the left/right separators
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.colnr = ' Co.'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"------------------------------------------------
" 3. indentLine Configuration
"------------------------------------------------

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2


"------------------------------------------------
" 4. Rainbow
"------------------------------------------------
au VimEnter * RainbowParenthesesToggle      " Toggle it on/off
au Syntax * RainbowParenthesesLoadRound     " ()
au Syntax * RainbowParenthesesLoadSquare    " []
au Syntax * RainbowParenthesesLoadBraces    " {}
au Syntax * RainbowParenthesesLoadChevrons  " <>

"------------------------------------------------
" 5. NCM2
"------------------------------------------------

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })
