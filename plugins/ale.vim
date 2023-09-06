Plug 'dense-analysis/ale'

let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['prettier']}
let g:ale_fixers = {'ruby': ['standardrb'], 'eruby': ['erblint'], 'javascript': ['eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ruby_indent_assignment_style = 'variable'

nnoremap <leader>l :ALEFix<cr>:w<cr>
