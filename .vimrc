set nu
set ai
se cin et nocp bs=2 sw=2 sts=2
set expandtab
set mouse=a
set visualbell
set t_vb=
set ffs=unix
set is
set ic
set nowrap
syn on
:inoremap ( ()<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
:inoremap [ []<Esc>i
:inoremap {<CR> {<CR>}<Esc>ko
:inoremap {{ {}<ESC>i

inoremap ) <C-R>=ClosePair(')')<CR>
inoremap ] <C-R>=ClosePair(']')<CR>
inoremap } <C-R>=ClosePair('}')<CR>
inoremap " <C-R>=QuoteDelim('"')<CR>
inoremap ' <C-R>=QuoteDelim("'")<CR>
filetype indent on
:ab WQ wq
:ab Wq wq
:ab wQ wq
:ab q1 q!
:ab W w

ino jk <Esc>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
    else
        "Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf

set autoread
function Fresh(arg)
    execute 'checktime'
endfunction
let timer = timer_start(500, 'Fresh', {'repeat': -1})



