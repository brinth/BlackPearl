set nocompatible
filetype off
syntax on
filetype plugin indent on
set mouse=a
set ruler
set number 
set relativenumber
set visualbell
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set showmode
set showcmd
set hlsearch
set incsearch
set smartcase
set showmatch
set noswapfile
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" --- KEY BINDINGS ---
let mapleader = " "
nnoremap H gT
nnoremap L gt

"NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>T :NERDTreeFind<CR>

"Window Navigation
nnoremap <leader>j 10j
nnoremap <leader>k 10k
nnoremap <leader>J 20jzz
nnoremap <leader>K 20kzz
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader>q :q<CR>

"Misc
nnoremap <leader>n :nohlsearch<CR>

"Fuzzy Finder
let g:fzf_layout = {"window": {"width":0.9, "height": 0.6, "border": "rounded"}}
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>r :Rg<CR>
"" Correct Rg command with improved result handling
"command! -nargs=* Rg call fzf#run(fzf#wrap('Rg', {
"  \ 'source': 'rg --vimgrep --hidden --glob "!.git/" --smart-case '.<q-args>,
"  \ 'sink*': function('s:OpenWithLocation'),
"  \ 'options': '--prompt "Rg> " --preview "bat --style=numbers --color=always --line-range :500 {}"',
"  \ 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded' }
"  \ }))
command! -nargs=* Rg call fzf#run(fzf#wrap('Rg', {
  \ 'source': 'rg --vimgrep --hidden --glob "!.git/" --smart-case '.<q-args>,
  \ 'sink*': function('s:OpenWithLocation'),
  \ 'options': '--prompt "Rg> " --preview "sh -c ''bat --style=numbers --color=always --line-range :500 \"$(echo {} | cut -d'':'\' -f1)\"''"',
  \ 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded' }
  \ }))

" Custom function to jump to file + line + column
function! s:OpenWithLocation(selected)
  let selected_str = join(a:selected, '')
  let parts = split(selected_str, ':')
  if len(parts) >= 2
    execute 'e ' . parts[0] | execute parts[1]
  endif
endfunction
" Map <leader>g to search for a string in the entire project
nnoremap <leader>g :Rg<Space>
" Map <leader>s to search for the word under the cursor in the project
nnoremap <leader>s :Rg <C-R><C-W><CR>

"Vim-LSP 
augroup lsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'allowlist': ['python'],
        \ })
augroup END

" Trigger function definition/declaration lookup
nnoremap <leader>d :LspDefinition<CR>
nnoremap <leader>r :LspReferences<CR>
"nnoremap <leader>h :LspHover<CR>  " For showing documentation

