" Vim syntax file

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" Define tag styles
if !exists('g:task_paper_styles')
    let g:task_paper_styles = {'FAIL': 'guibg=Red guifg=White'}
endif

syn case ignore

syn match todoProject	/^-\s\+\(\s\+@[^ \t(]\+\(([^)]*)\)\?\)$/ contains=todoContext
syn match todoProject	/^-\s\+.*$/
syn match todoProject	/^\+.*$/
syn match todoItem	/^\t\+-/
syn match todoItem	/^\t\+\*/
syn match todoItemUrg	/^\t\+!.*$/
syn match todoContext	/\s\zs@[^ \t(]\+\(([^)]*)\)\?/
syn match todoContextH	/\s\zsH@[^ \t(]\+\(([^)]*)\)\?/
syn match todoContextS	/\s\zsS@[^ \t(]\+\(([^)]*)\)\?/
syn match todoTime	/\[.*\]/
syn match todoDone	/^.*\s@done\(\(\s\|([^)]*)\).*\)\?$/
syn match todoCancelled	/^.*\s@cancelled\(\(\s\|([^)]*)\).*\)\?$/
syn match todoTODO	/^\t\+-.*:/
syn match todoComment	/^\t*#.*$/
syn match todoQuestion	/^\t*?.*$/
syn match todoTicked	/^\tx.*$/

syn sync fromstart

"highlighting for todo groups
HiLink todoItem		Identifier
HiLink todoItemUrg	Debug
HiLink todoContext	Special
HiLink todoContextS	Special
HiLink todoContextH	SpecialChar
HiLink todoTime		Delimiter
HiLink todoProject	Title
HiLink todoDone		NonText
HiLink todoCancelled	NonText
HiLink todoTodo		Keyword
HiLink todoQuestion	Comment
HiLink todoComment	SpecialComment
HiLink todoTicked	Delimiter

let b:current_syntax = "todo"

delcommand HiLink
" vim: ts=8
