"Basic settings I want                                                    
set number                                                               
set relativenumber            
syntax on          
"The bar at the bottom of the screen text settings                                                         
set statusline=Neovim:\%{expand('%:p:h')}\%m\%r\%f\%<\%=                    
"Sets colors schemes                                                        
"ctermfg is background and ctermbg is the text(I THINK)
highlight StatusLine ctermfg=darkmagenta ctermbg=lightmagenta
