" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

if has("gui_running")
  set background=dark
endif

" Remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "visnu"

hi Normal guibg=black guifg=#cccccc
hi Comment gui=NONE guifg=#666666
hi Constant guifg=#4DA07D
hi Define guibg=#260E3B guifg=#824589
hi Delimiter guibg=#001B1A guifg=#56A5A4
hi Function guibg=#250617 guifg=#8F674C
hi Identifier guibg=#250617 guifg=#8F674C
hi Include guifg=#837691
hi Number guifg=#95A658
hi Operator guifg=#7272AC
hi Special gui=NONE guifg=#7EA357
hi Statement gui=NONE guibg=#150026 guifg=#A3589F
hi String guibg=#261500 guifg=#BFBC98
hi Todo gui=bold guibg=#B26E6D guifg=#2F1E1C
hi Type guibg=#250808 guifg=#B75558

hi htmlTag guibg=#111111 guifg=#333333
hi link htmlEndTag htmlTag
hi htmlTagName guibg=#111111 guifg=#828282
hi link htmlSpecialTagName htmlTagName
hi htmlArg guibg=#111111 guifg=#666666
hi link htmlString htmlTagName

hi link javaScriptNumber Number

" vim: sw=2
