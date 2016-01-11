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
" And coffee script vim syntax
"   https://github.com/kchmck/vim-coffee-script/blob/master/syntax/coffee.vim

if exists("b:current_syn")
	finish
endif

" Group definitions

syn keyword imbaBoolean true false yes no on off
hi def link imbaBoolean Boolean

syn keyword imbaKeyword import await typeof extends super yield new in self
syn keyword imbaKeyword of by and or not is isnt isa var let tagdef expr

syn match imbaMethod /\w\+/ display contained
hi def link imbaMethod Structure

syn keyword imbaKeyword def class tag prop nextgroup=imbaMethod skipwhite
hi def link imbaKeyword Keyword

syn keyword imbaConditional if else elif unless switch then when 
hi def link imbaConditional Conditional

syn keyword imbaStatement continue break throw return
hi def link imbaStatement Statement

syn keyword imbaRepeat do for while until 
hi def link imbaRepeat Repeat

syn keyword imbaException try catch finally 
hi def link imbaException Exception

syn keyword imbaClass Math console
hi def link imbaClass StorageClass

syn keyword imbaFunction log warn
syn keyword imbaFunction sin cos
syn keyword imbaFunction append
hi def link imbaFunction Function

syn match imbaNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match imbaNumber /\<\%(Infinity\|NaN\)\>/ display
hi def link imbaNumber Number

syn match imbaFloat /\%(\i\|\$\)\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/ display
hi def link imbaFloat Float

syn region imbaStringVar start="{"hs=s+1 end="}"he=e-1 contained
syn region String start=/"/  skip=/\\"/  end=/"/ contains=imbaStringVar,@Spell
syn region String start=/'/  skip=/\\'/  end=/'/ contains=imbaStringVar,@Spell

syn keyword imbaTodo TODO FIXME TBD XXX HACK contained

syn match Comment "//.*" contains=imbaTodo display
syn match Comment "#.*" contains=imbaTodo display
syn region Comment start=/\/\*/ end=/\*\// contains=imbaTodo
syn region Comment start=/###/ end=/###/ contains=imbaTodo
hi def link imbaTodo Todo

syn match imbaOperator /\<\%(instanceof\|typeof\|delete\)\>/ display
hi def link imbaOperator Operator

" The first case matches symbol operators only if they have an operand before.
syn match imbaExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?.]\{-1,}\|[-=]>\|--\|++\|:/ display
syn match imbaExtendedOp /\<\%(and\|or\)=/ display
hi def link imbaExtendedOp imbaOperator

syn region imbaRegex start=/\// end=/\// display
hi def link imbaRegex Keyword

syn match imbaSpecialOp /[,;]/ display
hi def link imbaSpecialOp Delimiter

syn match imbaSpecialVar /\<\%(this\|prototype\|arguments\)\>/ display
hi def link imbaSpecialVar Special

syn match imbaSpecialIdent /@\%(\%(\I\|\$\)\%(\i\|\$\)*\)\?/ display
hi def link imbaSpecialIdent Identifier

syn match imbaGlobal /\<\%(null\|undefined\)\>/ display
hi def link imbaGlobal Type

syn match imbaConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link imbaConstant Constant

syn cluster imbaIdentifier contains=imbaSpecialVar,imbaSpecialIdent,imbaObject,imbaConstant 

syn match imbaObjAssign /@\?\%(\I\|\$\)\%(\i\|\$\)*\s*\ze::\@!/ contains=@imbaIdentifier display
hi def link imbaObjAssign Identifier

" Tags (html-like markup)

syn match imbaTagValue "=[\t ]*" contained
syn match imbaTags /\w+/ contained contains=imbaTagValue
syn region Tag start=/</ end=/>/ contains=imbaTags

" Error marking

syn match imbaSemicolonError /;$/ display
hi def link imbaSemicolonError Error

" Cleanup

let b:current_syn = "imba"

