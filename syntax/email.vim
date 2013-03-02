" Vim syntax file
" Language: Email
" Maintainer: David Elentok
" Filenames: *.email
"
if exists("b:current_syntax")
  finish
endif

hi def link emailField Function
hi def link emailSeparator Comment

syn match emailField "^\(From\|To\|Subject\):.*$"
syn match emailSeparator "^==.*$"
