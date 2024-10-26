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
badd +1 init.lua
badd +9 lua/chadrc.lua
badd +25 lua/configs/lazy.lua
badd +24 lua/configs/lspconfig.lua
badd +27 lua/plugins/init.lua
badd +3 lua/options.lua
badd +22 lua/configs/conform.lua
badd +7 lua/mappings.lua
argglobal
%argdel
edit init.lua
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
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 1resize ' . ((&columns * 119 + 240) / 480)
exe '2resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 2resize ' . ((&columns * 119 + 240) / 480)
exe '3resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 3resize ' . ((&columns * 119 + 240) / 480)
exe '4resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 4resize ' . ((&columns * 119 + 240) / 480)
exe '5resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 5resize ' . ((&columns * 120 + 240) / 480)
exe '6resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 6resize ' . ((&columns * 120 + 240) / 480)
exe 'vert 7resize ' . ((&columns * 119 + 240) / 480)
argglobal
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
let s:l = 35 - ((34 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 35
normal! 023|
wincmd w
argglobal
if bufexists(fnamemodify("lua/options.lua", ":p")) | buffer lua/options.lua | else | edit lua/options.lua | endif
if &buftype ==# 'terminal'
  silent file lua/options.lua
endif
balt lua/plugins/init.lua
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
let s:l = 28 - ((27 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 28
normal! 024|
wincmd w
argglobal
if bufexists(fnamemodify("lua/chadrc.lua", ":p")) | buffer lua/chadrc.lua | else | edit lua/chadrc.lua | endif
if &buftype ==# 'terminal'
  silent file lua/chadrc.lua
endif
balt init.lua
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
let s:l = 9 - ((8 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/configs/conform.lua", ":p")) | buffer lua/configs/conform.lua | else | edit lua/configs/conform.lua | endif
if &buftype ==# 'terminal'
  silent file lua/configs/conform.lua
endif
balt init.lua
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
let s:l = 22 - ((21 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 029|
wincmd w
argglobal
if bufexists(fnamemodify("lua/configs/lspconfig.lua", ":p")) | buffer lua/configs/lspconfig.lua | else | edit lua/configs/lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file lua/configs/lspconfig.lua
endif
balt lua/configs/lazy.lua
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
let s:l = 1 - ((0 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/mappings.lua", ":p")) | buffer lua/mappings.lua | else | edit lua/mappings.lua | endif
if &buftype ==# 'terminal'
  silent file lua/mappings.lua
endif
balt lua/configs/lazy.lua
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
let s:l = 7 - ((6 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/plugins/init.lua", ":p")) | buffer lua/plugins/init.lua | else | edit lua/plugins/init.lua | endif
if &buftype ==# 'terminal'
  silent file lua/plugins/init.lua
endif
balt lua/configs/lspconfig.lua
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
let s:l = 44 - ((43 * winheight(0) + 61) / 122)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 017|
wincmd w
5wincmd w
exe '1resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 1resize ' . ((&columns * 119 + 240) / 480)
exe '2resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 2resize ' . ((&columns * 119 + 240) / 480)
exe '3resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 3resize ' . ((&columns * 119 + 240) / 480)
exe '4resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 4resize ' . ((&columns * 119 + 240) / 480)
exe '5resize ' . ((&lines * 60 + 62) / 125)
exe 'vert 5resize ' . ((&columns * 120 + 240) / 480)
exe '6resize ' . ((&lines * 61 + 62) / 125)
exe 'vert 6resize ' . ((&columns * 120 + 240) / 480)
exe 'vert 7resize ' . ((&columns * 119 + 240) / 480)
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
