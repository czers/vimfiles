" File Name: nl.vim
" Maintainer: Michal Czerski <mac@atinea.pl>
" Description: Indent file for NianioLang
" Latest Revision: 23 August 2012
" Version: 1.0.2
" Depends on the GenericIndent function in genindent.vim

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let b:indent_block_start = '{'
let b:indent_block_end = '}'
let b:indent_ignore = '^\s*#'

setlocal indentexpr=GenericIndent(v:lnum)
" setlocal indentkeys=o,O,!^F,0=[exec],0=[end],0=[submenu],0=[restart],
"       \0=[config],0=[reconfig],0=[stylesdir],0=[stylesmenu],0=[begin],
"       \0=[workspaces],0=[exit],0=[include],0=[nop]
