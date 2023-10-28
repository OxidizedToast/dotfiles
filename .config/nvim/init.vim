"Basic Settings I want"
set number
set relativenumber
syntax on

"Bar at bottom of screen"
set statusline="Neovim:\%{expand('%:p:h')}\%m\%r\%f\%<\%=

"sets color scheme"
"ctermfg is background and ctermbg is text(I think)"
highlight StatusLine ctermfg=90  ctermbg=white
