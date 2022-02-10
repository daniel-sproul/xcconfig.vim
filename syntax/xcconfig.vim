if exists("b:current_syntax")
  finish
endif

" Comments start with // and continue for the rest of the line
syntax match xcconfigComment "\v\/\/.*" contains=@Spell oneline
highlight default link xcconfigComment Comment

" booleans
syntax keyword xcconfigBooleans
      \ YES
      \ NO
highlight default link xcconfigBooleans Boolean

" Numbers
syntax match xcconfigNumber "\v<\d+>"
syntax match xcconfigNumber "\v<\v\d+[[:digit:]\.]+\d+>"
highlight default link xcconfigNumber Number

" Various special keywords that deserve custom highlighting
syntax match xcconfigAttributes /@executable_path\>/
syntax match xcconfigAttributes /@loader_path\>/
syntax match xcconfigAttributes /@rpath\>/
syntax keyword xcconfigAttributes inherited
highlight default link xcconfigAttributes PreProc

" Includes start with one of these identifiers, followed by a double quoted path
syntax match xcconfigImports /#include\>/
syntax match xcconfigImports /#include?/
highlight default link xcconfigImports Include

" Variable regions, this matches either $(FOO) or ${BAR} style variables on a
" single line. They can contain special keywords (like 'inherited')
syntax region xcconfigVariable start=/$(/ end=/)/ contains=xcconfigAttributes oneline
syntax region xcconfigVariable start=/${/ end=/}/ contains=xcconfigAttributes oneline
highlight default link xcconfigVariable Identifier

" Strings, anything wrapped in single or double quotes for one line
syntax region xcconfigString start=/"/ end=/"/ oneline
syntax region xcconfigString start=/'/ end=/'/ oneline
highlight default link xcconfigString String

" Conditional variable assignment
" These take the form:
"   FOO[config=Debug] = Bar
syntax region xcconfigConditionalExpr start=/\[/ end=/\]/ contains=xcconfigConditional oneline
syntax keyword xcconfigConditional arch config sdk contained
highlight default link xcconfigConditional Conditional

let b:current_syntax = "xcconfig"
