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
badd +93 lua/config/lspconfig.lua
badd +40 lua/config/conform.lua
badd +57 lua/config/mason.lua
badd +39 lua/plugins/lspconfig.lua
badd +57 lua/plugins/material.lua
badd +21 lua/plugins/fzf.lua
badd +3 lua/mappings.lua
badd +170 lua/config/fzf.lua
badd +18 lua/plugins/which-key.lua
badd +1 ./lua/config/cmp.lua
badd +19 ./lua/plugins/cmp.lua
badd +0 lua/config/indent-blankline.lua
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
exe 'vert 1resize ' . ((&columns * 119 + 240) / 480)
exe 'vert 2resize ' . ((&columns * 119 + 240) / 480)
exe 'vert 3resize ' . ((&columns * 120 + 240) / 480)
exe 'vert 4resize ' . ((&columns * 119 + 240) / 480)
argglobal
balt lua/config/fzf.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 61) / 123)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/config/lspconfig.lua", ":p")) | buffer lua/config/lspconfig.lua | else | edit lua/config/lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file lua/config/lspconfig.lua
endif
balt lua/config/fzf.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 29 - ((28 * winheight(0) + 61) / 123)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 29
normal! 06|
wincmd w
argglobal
if bufexists(fnamemodify("lua/config/indent-blankline.lua", ":p")) | buffer lua/config/indent-blankline.lua | else | edit lua/config/indent-blankline.lua | endif
if &buftype ==# 'terminal'
  silent file lua/config/indent-blankline.lua
endif
balt ./lua/plugins/cmp.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 61) / 123)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("./lua/plugins/cmp.lua", ":p")) | buffer ./lua/plugins/cmp.lua | else | edit ./lua/plugins/cmp.lua | endif
if &buftype ==# 'terminal'
  silent file ./lua/plugins/cmp.lua
endif
balt lua/plugins/which-key.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 61) / 123)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 027|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 240) / 480)
exe 'vert 2resize ' . ((&columns * 119 + 240) / 480)
exe 'vert 3resize ' . ((&columns * 120 + 240) / 480)
exe 'vert 4resize ' . ((&columns * 119 + 240) / 480)
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
