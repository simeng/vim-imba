" Vim syntax file
"
" Language: Imba
" Language URL: http://imba.io/
"
" Maintainer: Simen Graaten <simeng@gmail.com>
" URL: https://github.com/simeng/vim-imba
"
" Based on work from sublime syntax file
"   https://github.com/somebee/sublime-imba/blob/master/Imba.sublime-syntax

if exists("b:current_syntax")
	finish
endif

syntax keyword imbaBoolean true false
syntax keyword imbaKeyword if else elif unless for while
syntax keyword imbaKeyword return until switch then when 
syntax keyword imbaKeyword try catch finally continue break throw 
syntax keyword imbaKeyword do await typeof class
syntax keyword imbaKeyword import

syntax keyword imbaClass Math console

syntax keyword imbaFunction log warn
syntax keyword imbaFunction sin cos
syntax keyword imbaFunction append

syntax match imbaNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

syntax region String matchgroup=Quote start=/"/  skip=/\\"/  end=/"/

syntax match Comment "//.*"
syntax region Comment start=/\/\*/ end=/\*\//

highlight link imbaKeyword Keyword
highlight link imbaFunction Function
highlight link imbaClass StorageClass
highlight link imbaBoolean Boolean
highlight link imbaNumber Number

let b:current_syntax = "imba"

