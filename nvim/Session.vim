let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.config/nvim
badd +1 ~/.config
badd +4 lua/plugins/colorscheme.lua
badd +12 lua/plugins/telescope.lua
badd +11 lua/plugins/mini.lua
badd +10 lua/plugins/formatter.lua
badd +36 lua/config/keymaps.lua
badd +1 lua/config/autocmds.lua
badd +33 lua/config/lazy.lua
badd +1 ~/.local/state/nvim/lsp.log
badd +1 lua/plugins/lsp.lua
badd +1 health://
badd +1 lua/plugins/treesitter.lua
badd +1 lua/plugins/astro.lua
badd +42 lua/plugins/cmp.lua
badd +1 lua/plugins/wrapping.lua
badd +17 lua/config/options.lua
badd +3 lua/plugins/harpoon.lua
argglobal
%argdel
edit lua/config/keymaps.lua
argglobal
balt lua/plugins/lsp.lua
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
let s:l = 44 - ((18 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 44
normal! 014|
lcd ~/.dotfiles/nvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
