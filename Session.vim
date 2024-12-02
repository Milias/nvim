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
badd +39 lua/config/lazy.lua
badd +52 lua/config/opts.lua
badd +47 lua/config/lspconfig.lua
badd +40 lua/config/conform.lua
badd +57 lua/config/mason.lua
badd +39 lua/plugins/lspconfig.lua
badd +57 lua/plugins/material.lua
badd +21 lua/plugins/fzf.lua
badd +3 lua/mappings.lua
badd +170 lua/config/fzf.lua
badd +18 lua/plugins/which-key.lua
badd +49 ./lua/config/cmp.lua
badd +19 ./lua/plugins/cmp.lua
badd +1 lua/config/indent-blankline.lua
badd +0 ./lua/plugins/noice.lua
badd +6 lua/config/noice.lua
argglobal
%argdel
edit ./lua/config/cmp.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
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
exe 'vert 1resize ' . ((&columns * 106 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 106 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 106 + 160) / 320)
argglobal
balt lua/config/fzf.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 20 - ((19 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 052|
wincmd w
argglobal
if bufexists(fnamemodify("lua/config/noice.lua", ":p")) | buffer lua/config/noice.lua | else | edit lua/config/noice.lua | endif
if &buftype ==# 'terminal'
  silent file lua/config/noice.lua
endif
balt lua/config/lspconfig.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 7 - ((6 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("./lua/plugins/noice.lua", ":p")) | buffer ./lua/plugins/noice.lua | else | edit ./lua/plugins/noice.lua | endif
if &buftype ==# 'terminal'
  silent file ./lua/plugins/noice.lua
endif
balt lua/config/indent-blankline.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 17 - ((16 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 028|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 106 + 160) / 320)
exe 'vert 3resize ' . ((&columns * 106 + 160) / 320)
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
