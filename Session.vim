let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +41 lua/config/lazy.lua
badd +52 lua/config/opts.lua
badd +52 lua/config/lspconfig.lua
badd +28 lua/config/conform.lua
badd +46 lua/config/mason.lua
badd +1 lua/plugins/lspconfig.lua
badd +57 lua/plugins/material.lua
badd +21 lua/plugins/fzf.lua
badd +3 lua/mappings.lua
badd +221 lua/config/fzf.lua
badd +18 lua/plugins/which-key.lua
badd +69 ./lua/config/cmp.lua
badd +19 ./lua/plugins/cmp.lua
badd +1 lua/config/indent-blankline.lua
badd +18 ./lua/plugins/noice.lua
badd +7 lua/config/noice.lua
badd +6 lua/plugins/mdx.lua
badd +23 ./lua/config/treesitter.lua
badd +1 ~/.config/nvim/Session.vim
badd +1 ~/.config/nvim/init.lua
badd +1 ~/.config/nvim/lua/plugins/codeium.lua
badd +1 lua/plugins/claude-code.lua
badd +1 lua/config/material.lua
badd +0 man://selinux_config(5)
argglobal
%argdel
edit lua/plugins/claude-code.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/.config/nvim/lua/plugins/codeium.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 53) / 106)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/plugins/lspconfig.lua", ":p")) | buffer lua/plugins/lspconfig.lua | else | edit lua/plugins/lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugins/lspconfig.lua
endif
balt lua/config/fzf.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 53) / 106)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/config/lspconfig.lua", ":p")) | buffer lua/config/lspconfig.lua | else | edit lua/config/lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file lua/config/lspconfig.lua
endif
balt lua/config/material.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 52 - ((51 * winheight(0) + 53) / 106)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 52
normal! 0
wincmd w
3wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
