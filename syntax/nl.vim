" File Name: nl.vim
" Maintainer: Michal Czerski <mac@atinea.pl>
" Description: Syntax file for NianioLang
" Latest Revision: 23 August 2012
" Version: 1.0.2

if exists("b:current_syntax")
  finish
endif

syn sync fromstart

syn keyword nlTodo contained TODO FIXME XXX NOTE
syn match nlComment "#.*$" contains=nlTodo

syn region nlFold start="{" end="}" transparent fold
set foldmethod=syntax

syn match nlString "'[^']*'"
syn match nlMultiString "\(\s*'[^']*\n\)\+\s*'[^']*'"
syn match nlNumber "\<[[:digit:]_]\+\>"

syn keyword nlKeyword use def var return eq ne cmp ref fun die
syn keyword nlRepeat while rep loop fora forh continue break
syn keyword nlConditional if elsif else unless match
syn keyword nlLabel case

syn match nlVariant "\:\&\:\i\+"
syn match nlPublic "\i\+\:\{2}" nextgroup=nlFunction
syn match nlFunctionRef "@\i\+\:\{2}\i\+"
syn match nlFunction "\i\+" contained
"syn match nlOperator "\(!\|+\|-\|\.\|=\|>\|<\)"

let b:current_syntax = "nl"

hi def link nlTodo        Todo
hi def link nlComment     Comment

hi def link nlString      String
hi def link nlMultiString String
hi def link nlNumber      Number

hi def link nlKeyword     Statement
hi def link nlRepeat      Repeat
hi def link nlConditional Conditional
hi def link nlLabel       Label

hi def link nlVariant     Constant
hi def link nlPublic      Special
hi def link nlFunctionRef Function
"hi def link nlFunction    Function
"hi def link nlOperator    Operator
