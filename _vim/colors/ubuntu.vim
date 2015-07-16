" Vim color scheme
"
" Name:         ubuntu.vim
" Maintainer:   Nick Moffitt <nick@zork.net>
" Last Change:  30 Oct 2012
" License:      WTFPL <http://sam.zoy.org/wtfpl/>
" Version:      2.2
"
" This theme is based on Josh O'Rourke's Vim clone of the railscast
" textmate theme.  The key thing I have done here is supply 256-color
" terminal equivalents for as many of the colors as possible, and fixed
" up some of the funny behaviors for editing e-mails and such.
"
" To use for gvim:
" 1: install this file as ~/.vim/colors/railscasts.vim
" 2: put "colorscheme railscasts" in your .gvimrc
"
" If you are using Ubuntu, you can get the benefit of this in your
" terminals using ordinary vim by taking the following steps:
"
" 1: sudo apt-get install ncurses-term
" 2: put the following in your .vimrc
"     if $COLORTERM == 'gnome-terminal'
"         set term=gnome-256color
"         colorscheme railscasts
"     else
"         colorscheme default
"     endif
" 3: if you wish to use this with screen, add the following to your .screenrc:
"     attrcolor b ".I"
"     termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
"     defbce "on"
"     term screen-256color-bce

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ubuntu"

hi link htmlTag                     xmlTag
hi link htmlTagName                 xmlTagName
hi link htmlEndTag                  xmlEndTag
"
"Moin syntax angry fruit salad repairs
hi link moinItalic	Comment
hi link moinSettings	PreProc
hi link moinStrike	Error
hi link moinTableMark	Operator
hi link moinTableOpt	Special
hi link moinCode	String
hi link moinProcessor	PreProc
hi link moinLink	Function
hi link moinSmileys	mailSubject


hi! link Special	ubuntu_orange
hi! link Title		ubuntu_orange
hi! link Visual         white_on_ubuntu_orange
hi! link CursorLineNr	aubergine_on_white

hi! link LineNr		grey_on_aubergine
hi! link StatusLine	white_on_aubergine
hi! link Folded		aubergine_on_grey
hi! link FoldColumn	white_on_aubergine
hi! link SignColumn	aubergine_on_grey
hi! link Conceal	aubergine_on_grey

hi! link StatusLineNC	black_on_dark_grey
hi! link VertSplit	aubergine_on_white
hi! link NonText	dark_grey
hi! link SpecialKey	dark_grey

hi! link Constant	aubergine_70
hi! link Identifier	aubergine_70
hi! link Type           aubergine_70
hi! link pythonBuiltin  Type
hi! link PreProc	aubergine_50

hi! link Function	ubuntu_orange_70

hi! link Define		aubergine_25
hi! link Include	aubergine_25
hi! link PreCondit	aubergine_25
hi! link Keyword	aubergine_25
hi! link Statement	aubergine_25

hi! link String		ubuntu_orange_25
hi! link Number		ubuntu_orange_50
hi! link Comment	ubuntu_grey_it
hi! link Todo		ubuntu_cyan
hi! link Question	ubuntu_cyan
hi! link MoreMsg	Question
hi! link Directory	ubuntu_cyan

hi! link diffRemoved Comment
hi! link diffAdded   String
hi! link diffChanged Function

hi! link DiffChange	ubuntu_cyan
hi! link DiffAdd	white_on_ubuntu_green
hi! link DiffDelete	white_on_ubuntu_red
hi! link DiffText	white_on_ubuntu_red
hi! link Error		white_on_ubuntu_red
hi! link pythonError	Error

hi! link WarningMsg	ubuntu_yellow
hi! link WildMenu	black_on_ubuntu_yellow

hi! link mailHeaderKey	PreProc
hi! link mailEmail	Underlined
hi! link mailSubject    String

hi! link markdownListMarker	Delimiter


hi ubuntu_orange	guifg=#f37320 ctermfg=202 gui=bold cterm=bold
hi ubuntu_orange_70	guifg=#f7995b ctermfg=209
hi ubuntu_orange_50	guifg=#fab382 ctermfg=216
hi ubuntu_orange_25	guifg=#fdd7bb ctermfg=223
hi aubergine		guifg=#851f73 ctermfg=89 cterm=bold gui=bold
hi aubergine_70		guifg=#a06092 ctermfg=132 cterm=bold gui=bold
hi aubergine_50		guifg=#b384a9 ctermfg=139 cterm=bold gui=bold
hi aubergine_25		guifg=#d3bbcf ctermfg=182 cterm=bold gui=bold

hi grey_on_aubergine	guibg=#2c001e ctermbg=89 guifg=#aea79f ctermfg=248
hi white_on_aubergine	guibg=#772953 ctermbg=89 guifg=#eeeeee ctermfg=231 cterm=bold gui=bold
hi aubergine_on_white	guibg=#ffffff ctermbg=231 guifg=#772953 ctermfg=89
hi aubergine_on_grey	guibg=#aea79f ctermbg=248 guifg=#772953 ctermfg=89
hi white_on_ubuntu_orange guibg=#f37320 ctermbg=202 guifg=#ffffff ctermfg=231

hi ubuntu_red		guifg=#df382c ctermfg=160 gui=bold cterm=bold
hi white_on_ubuntu_red	guibg=#df382c ctermbg=160 guifg=#ffffff ctermfg=231
hi ubuntu_grey		guifg=#aea79f ctermfg=248
hi ubuntu_grey_it	guifg=#aea79f ctermfg=248 gui=italic
hi ubuntu_yellow	guifg=#efb73e ctermfg=221 gui=bold cterm=bold
hi black_on_ubuntu_yellow ctermbg=221 guibg=#efb73e ctermfg=16 guifg=#000000
hi ubuntu_cyan		guifg=#19b6ee ctermfg=39 gui=bold cterm=bold
hi ubuntu_green		guifg=#38B44A ctermfg=71 gui=bold cterm=bold
hi white_on_ubuntu_green guibg=#38B44A ctermbg=71 guifg=#ffffff ctermfg=231

hi dark_grey		guifg=#707070 ctermfg=242
hi black_on_dark_grey	guibg=#707070 ctermbg=242 guifg=#000000 ctermfg=16

" Set the base gvim colors to match the Ubuntu terminal defaults
highlight Normal                    guifg=#ffffff guibg=#2c001e 
highlight Cursor                    guifg=#000000 ctermfg=0 guibg=#dd4814 ctermbg=166
highlight CursorLine                guibg=#000000 cterm=NONE


highlight Search                    guifg=NONE ctermfg=NONE guibg=#2b2b2b ctermbg=235 gui=italic cterm=underline

highlight SpellBad                  guifg=#df382c ctermfg=160 ctermbg=NONE cterm=underline
highlight SpellRare                 guifg=#19b6ee ctermfg=39 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight SpellCap                  guifg=#efb73e ctermfg=215 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight MatchParen                guifg=#FFFFFF ctermfg=16 guibg=#005f5f ctermbg=39

" https://github.com/nathanaelkane/vim-indent-guides 
" These values will be ignored if g:indent_guides_auto_colors is 1.
if !has('gui_running')
	let g:indent_guides_auto_colors = 0
	hi! IndentGuidesEven ctermbg=232
	hi! IndentGuidesOdd ctermbg=234
endif
hi ColorColumn guibg=#303030 ctermbg=234
