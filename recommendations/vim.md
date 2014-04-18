# Vim

Vim tips and tricks

## Mappings

Map your leader to your mostly used commands.

For me:

    map <Leader>m :make<CR>
    map <Leader>w :w<CR>
    map <Leader>q :q

    map <Leader>ga :Git add %:p<CR><CR>
    map <Leader>gs :Gstatus<CR>
    map <Leader>gc :Gcommit -v -q<CR>
    map <Leader>gd :Gdiff<CR>
    map <Leader>gb :Gblame<CR>
    map <Leader>gp :!git push<space>

    map <Leader>m :Make<CR>

    map <Leader>h <C-w>h
    map <Leader>j <C-w>j
    map <Leader>k <C-w>k
    map <Leader>l <C-w>l

    map <Leader>s <C-w>s
    map <Leader>v <C-w>v

Dont use the arrow keys, you will get faster, I guarantee it!

    map <UP> <NOP>
    map <DOWN> <NOP>
    map <LEFT> <NOP>
    map <RIGHT> <NOP>

You know this ugly window coming up every time you fail `:q`? Hide it!

    map q: :q

Move between screen lines instead of real lines.

    noremap k gk
    noremap j gj

## Plugins

Use vim-dispatch and fugitive from tpope! Use YouCompleteMe!
