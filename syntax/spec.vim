" Vim syntax file
" Language:     Certif SPEC Macros (www.certif.com)
" Maintainer:   Tomasz Wyderka <wyderkat@cofoh.com>
" Website:      www.cofoh.com
" Github:       https://github.com/wyderkat/certif-spec-syntax-vim



" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn keyword specStatement       array byte double float long string short ubyte ulong ushort 
syn keyword specStatement       constant extern global local shared undef unglobal 
syn keyword specStatement       print eprint p 
syn keyword specStatement       history lscmd lsdef syms 
syn keyword specStatement       getcounts memstat move_all move_cnt mv mvr
syn keyword specStatement       reconfig savstate sync 
syn keyword specConditional     else if
syn keyword specRepeat          for while
syn keyword specOperator        in
syn keyword specException       return quit exit break continue delete 
syn keyword specStatement       def rdef prdef nextgroup=specFunction skipwhite
syn keyword specInclude         dofile do qdofile qdo

" TODO 
" The zero-length non-grouping match before the function name is
" extremely important in pythonFunction.  Without it, everything is
" interpreted as a function inside the contained environment of
" doctests.
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match   specFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained

syn region  specString
      \ start=+\z(["]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=specEscape,specVariable,@Spell

" TODO 
syn match   specString "'.*'" contains=specEscape,specVariable,@Spell

syn match   specEscape        +\\[abfnrtv'"\\]+ contained
syn match   specEscape        "\\\o\{1,3}" contained
syn match   specEscape        "\\x\x\{2}" contained

syn match   specVariable      "\$#\|\$\d\{1,2}" 

syn match   specComment         "#.*$" contains=specTodo,@Spell
syn keyword specTodo            FIXME NOTE NOTES TODO XXX contained


" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"

  " numbers (including longs and complex)
  syn match   specNumber      "\<0[oO]\=\o\+[Ll]\=\>"
  syn match   specNumber      "\<0[xX]\x\+[Ll]\=\>"
  syn match   specNumber      "\<0[bB][01]\+[Ll]\=\>"
  syn match   specNumber      "\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   specNumber      "\<\d\+[jJ]\>"
  syn match   specNumber      "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   specNumber
        \ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   specNumber
        \ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

syn keyword specBuiltin     acos
syn keyword specBuiltin     array_dump
syn keyword specBuiltin     array_fit
syn keyword specBuiltin     array_op
syn keyword specBuiltin     array_pipe
syn keyword specBuiltin     array_plot
syn keyword specBuiltin     array_read
syn keyword specBuiltin     asc
syn keyword specBuiltin     asin
syn keyword specBuiltin     atan
syn keyword specBuiltin     atan2
syn keyword specBuiltin     bcd
syn keyword specBuiltin     ca_cntl
syn keyword specBuiltin     ca_fna
syn keyword specBuiltin     ca_get
syn keyword specBuiltin     calc
syn keyword specBuiltin     ca_put
syn keyword specBuiltin     cdef
syn keyword specBuiltin     chdir
syn keyword specBuiltin     chg_dial
syn keyword specBuiltin     chg_offset
syn keyword specBuiltin     close
syn keyword specBuiltin     cnt_mne
syn keyword specBuiltin     cnt_name
syn keyword specBuiltin     cnt_num
syn keyword specBuiltin     cos
syn keyword specBuiltin     counter_par
syn keyword specBuiltin     data_anal
syn keyword specBuiltin     data_bop
syn keyword specBuiltin     data_dump
syn keyword specBuiltin     data_fit
syn keyword specBuiltin     data_get
syn keyword specBuiltin     data_grp
syn keyword specBuiltin     data_info
syn keyword specBuiltin     data_nput
syn keyword specBuiltin     data_pipe
syn keyword specBuiltin     data_plot
syn keyword specBuiltin     data_put
syn keyword specBuiltin     data_read
syn keyword specBuiltin     data_uop
syn keyword specBuiltin     date
syn keyword specBuiltin     dcb
syn keyword specBuiltin     deg
syn keyword specBuiltin     dial
syn keyword specBuiltin     eprintf
syn keyword specBuiltin     exp
syn keyword specBuiltin     exp10
syn keyword specBuiltin     fabs
syn keyword specBuiltin     file_info
syn keyword specBuiltin     fmt_close
syn keyword specBuiltin     fmt_read
syn keyword specBuiltin     fmt_write
syn keyword specBuiltin     fprintf
syn keyword specBuiltin     getenv
syn keyword specBuiltin     gethelp
syn keyword specBuiltin     get_lim
syn keyword specBuiltin     getline
syn keyword specBuiltin     getval
syn keyword specBuiltin     gpib_cntl
syn keyword specBuiltin     gpib_get
syn keyword specBuiltin     gpib_poll
syn keyword specBuiltin     gpib_put
syn keyword specBuiltin     image_get
syn keyword specBuiltin     image_par
syn keyword specBuiltin     image_put
syn keyword specBuiltin     index
syn keyword specBuiltin     input
syn keyword specBuiltin     int
syn keyword specBuiltin     length
syn keyword specBuiltin     log
syn keyword specBuiltin     log10
syn keyword specBuiltin     mca_get
syn keyword specBuiltin     mca_par
syn keyword specBuiltin     mca_put
syn keyword specBuiltin     mca_sel
syn keyword specBuiltin     mca_sget
syn keyword specBuiltin     mca_spar
syn keyword specBuiltin     mca_sput
syn keyword specBuiltin     mcount
syn keyword specBuiltin     motor_mne
syn keyword specBuiltin     motor_name
syn keyword specBuiltin     motor_num
syn keyword specBuiltin     motor_par
syn keyword specBuiltin     off
syn keyword specBuiltin     on
syn keyword specBuiltin     open
syn keyword specBuiltin     plot_cntl
syn keyword specBuiltin     plot_move
syn keyword specBuiltin     plot_range
syn keyword specBuiltin     port_get
syn keyword specBuiltin     port_getw
syn keyword specBuiltin     port_put
syn keyword specBuiltin     port_putw
syn keyword specBuiltin     pow
syn keyword specBuiltin     printf
syn keyword specBuiltin     rad
syn keyword specBuiltin     rand
syn keyword specBuiltin     read_motors
syn keyword specBuiltin     ser_get
syn keyword specBuiltin     ser_par
syn keyword specBuiltin     ser_put
syn keyword specBuiltin     set_lim
syn keyword specBuiltin     set_sim
syn keyword specBuiltin     sin
syn keyword specBuiltin     sleep
syn keyword specBuiltin     sock_io
syn keyword specBuiltin     spec_par
syn keyword specBuiltin     split
syn keyword specBuiltin     sprintf
syn keyword specBuiltin     sqrt
syn keyword specBuiltin     srand
syn keyword specBuiltin     sscanf
syn keyword specBuiltin     stop
syn keyword specBuiltin     substr
syn keyword specBuiltin     tan
syn keyword specBuiltin     tcount
syn keyword specBuiltin     time
syn keyword specBuiltin     tty_cntl
syn keyword specBuiltin     tty_fmt
syn keyword specBuiltin     tty_move
syn keyword specBuiltin     unix
syn keyword specBuiltin     user
syn keyword specBuiltin     vme_get
syn keyword specBuiltin     vme_get32
syn keyword specBuiltin     vme_move
syn keyword specBuiltin     vme_put
syn keyword specBuiltin     vme_put32
syn keyword specBuiltin     wait
syn keyword specBuiltin     whatis
syn keyword specBuiltin     yesno
syn keyword specBuiltin     cleanup
syn keyword specBuiltin     cleanup1
syn keyword specBuiltin     cleanup_once
syn keyword specBuiltin     cleanup_always
syn keyword specBuiltin     end_mac

syn keyword specBuiltvar    A
syn keyword specBuiltvar    COLS
syn keyword specBuiltvar    COUNTERS
syn keyword specBuiltvar    CWD
syn keyword specBuiltvar    DEBUG
syn keyword specBuiltvar    DISPLAY
syn keyword specBuiltvar    FRESH
syn keyword specBuiltvar    GTERM
syn keyword specBuiltvar    HOME
syn keyword specBuiltvar    MOTORS
syn keyword specBuiltvar    PAGER
syn keyword specBuiltvar    PI
syn keyword specBuiltvar    ROWS
syn keyword specBuiltvar    S
syn keyword specBuiltvar    SPEC
syn keyword specBuiltvar    SPECD
syn keyword specBuiltvar    TERM
syn keyword specBuiltvar    USER
syn keyword specBuiltvar    VERSION

" Sync at the beginning of function definition.
syn sync match specSync grouphere NONE "^\s*\%(def\|rdef\)\s\+\h\w*\s*("

if version >= 508 || !exists("did_spec_syn_inits")
  if version <= 508
    let did_spec_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink specVariable         Define
  HiLink specStatement        Statement
  HiLink specConditional      Conditional
  HiLink specRepeat           Repeat
  HiLink specOperator         Operator
  HiLink specException        Exception
  HiLink specInclude          Include
  HiLink specFunction         Function
  HiLink specComment          Comment
  HiLink specTodo             Todo
  HiLink specString           String
  HiLink specEscape           Special
  HiLink specNumber           Number
  HiLink specBuiltin          Function
  HiLink specBuiltvar         Structure

  delcommand HiLink
endif

let b:current_syntax = "spec"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 :
