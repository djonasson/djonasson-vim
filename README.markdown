# What is it?

djonasson-vim is my personal vim installation. It's focused on providing an
optimal programming environment, particularly for (but by no means limited to)
Ruby on Rails development.

It uses [Vundle](http://github.com/gmarik/vundle) (Vim bUNDLE) to handle
plugins.


# Pre-requisites

* git
* curl (for the automatic installer)
* vim ;)


# Installation

The easiest way to install djonasson-vim is to use the automatic installer by
pasting the followin line in a terminal. It will backup your existing vim
configuration and install djonasson-vim.

    curl https://raw.github.com/djonasson/djonasson-vim/master/bootstrap.sh -L -o - | sh

## What does the install script do?

I know - I don't like to have unknown scripts messing around with my system
either... To see exactly what it does, please [take a look at the script](https://raw.github.com/djonasson/djonasson-vim/master/bootstrap.sh) before running it. Basically what it does is:

1. It backups your existing vim configuration by renaming (appending the current date):

        ~/.vim => ~/.vim.CURRENT_DATE
        ~/.vimrc => ~/.vimrc.CURRENT_DATE
        ~/.gvimrc => ~/.gvimrc.CURRENT_DATE
        ~/.djonasson-vim => ~/.djonasson-vim.CURRENT_DATE

2. It clones the djonasson-vim git repository into your home directory:

        git clone git://github.com/djonasson/djonasson-vim.git ~/.djonasson-vim

3. It sets up necessary symlinks:

        ln -s ~/.djonasson-vim/ ~/.vim
        ln -s ~/.djonasson-vim/vimrc ~/.vimrc
        ln -s ~/.djonasson-vim/gvimrc ~/.gvimrc

4. It clones the Vundle repository into the ~/.djonasson-vim/bundle/vundle and uses it to install all the plugins specified in the vimrc file (for a list of plugins see dedicated section below).


# Usage

## Customizations

Although djonasson-vim comes with a complete vim setup you might want to
disable some plugin, add your own or make modifications to the vim
configuration in general. You can make such customizations in these files:

    ~/.vimrc.local
    ~/.gvimrc.local
    ~/.vimrc.bundles.local

In the `.vimrc.bundles.local` file, apart from adding your own bundles, you
can chose which of the default bundle groups to load:

    let g:djonasson_bundle_groups=['general', 'vcs', 'programming', 'php', 'ruby', 'rails', 'python', 'javascript', 'html', 'misc']


## Installing/Updating/Removing Plugins

You can manage your plugins, through vundler, directly from within vim:

    :BundleList     - List installed plugins
    :BundleInstall  - Installs your plugins
    :BundleInstall! - Updates your plugins

For more bundle commands and help, type:

    :help Bundle

## Updating djonasson-vim

    cd ~/.djonasson-vim
    git pull
    vim +BundleInstall! +BundleClean +q


# Plugins

Over the years I've tried quite a few vim plugins but these are the ones that
I currently use and that will be installed through vundler:

## General

* [Vundle](http://github.com/gmarik/vundle)
* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [NERD Tree Tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-surround](http://github.com/tpope/vim-surround)
* [vim-fuzzyfinder](http://github.com/clones/vim-fuzzyfinder)
* [vim-l9](http://github.com/clones/vim-l9)
* [vim-supertab](http://github.com/tsaleh/vim-supertab)
* [BufOnly.vim](http://github.com/vim-scripts/BufOnly.vim)
* [minibufexpl.vim](http://github.com/fholgado/minibufexpl.vim)

## VCS

* [vim-fugitive](http://github.com/tpope/vim-fugitive)

## Programming
* [vim-commentary.git](http://github.com/tpope/vim-commentary.git)
* [syntastic](http://github.com/scrooloose/syntastic)
* [vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils)
* [tlib_vim](http://github.com/tomtom/tlib_vim)
* [snipmate-snippets](http://github.com/vim-scripts/snipmate-snippets)
* [vim-snipmate](http://github.com/garbas/vim-snipmate)
* [nerdcommenter](http://github.com/scrooloose/nerdcommenter)
* [tabular](http://github.com/godlygeek/tabular)

### HTML
* [HTML-AutoCloseTag](http://github.com/vim-scripts/HTML-AutoCloseTag)
* [Better-CSS-Syntax-for-Vim](http://github.com/ChrisYip/Better-CSS-Syntax-for-Vim)

### Javascript
* [vim-json](http://github.com/leshill/vim-json)
* [vim-less](http://github.com/groenewege/vim-less)
* [vim-web-indent](http://github.com/taxilian/vim-web-indent)

### Misc.
* [vim-markdown](http://github.com/spf13/vim-markdown)

### PHP
* [PIV](http://github.com/spf13/PIV)

### Python
* [python-mode](http://github.com/klen/python-mode)
* [python.vim](http://github.com/vim-scripts/python.vim)
* [python_match.vim](http://github.com/vim-scripts/python_match.vim)
* [pythoncomplete](http://github.com/vim-scripts/pythoncomplete)

### Ruby
* [vim-endwise](http://github.com/tpope/vim-endwise)
* [vim-cucumber](http://github.com/tpope/vim-cucumber)

#### Ruby on Rails

* [vim-rails](http://github.com/tpope/vim-rails)
* [vim-haml.git](http://github.com/tpope/vim-haml.git)
* [Railscasts-Theme-GUIand256color](http://github.com/vim-scripts/Railscasts-Theme-GUIand256color)


# Tips

## Escape Re-binding

It's probably a good idea to re-bind a key to the escape key since it's used
all the time. You should chose a key that you can reach without moving your
hands from their default position. For me, on my MS Natural Elite keyboard,
this means the right popup menu key. It can be done by using something like
xmodmap:

    xmodmap -e 'keycode 117=Escape'


# Basic vim usage

To access the build in help of vi, you just need to type:

    :help

But for the very basics you can take a look at the following little cheat
sheet that I've put together:

## Moving around
    h - move left
    l - move right
    j - move down
    k - move up
    fx - move the cursor to the next occurance of x
    Fx - move the cursor to the previous occurance of x
    tx - move the cursor to before the next occurance of x
    Tx - move the cursor to before the previous occurance of x
    w - move the cursor forward by a word
    b - move the cursor backward by a word
    0 - first column of line
    $ - last column of line
    ^ - first non-empty column of line
    g_ - last non-emtpy column of line
    Ctrl-e - up 1 line
    Ctrl-u - up 1/2 page
    Ctrl-f - up 1 page
    Ctrl-y - down 1 line
    Ctrl-d - down 1/2 page
    Ctrl-b - down 1 page
    H - top left
    M - middle left
    L - bottom left
    G - move cursor to the end of the file
    gg - move cursor to the beginning of the file
    gi - move to last edit position and switch to insert mode
    * - go to the next occurance of the word under the cursor
    # - go to the previous occurance of the word under the cursor
    :N - go to line number N

## Insert, Delete, Copy, etc.
    i - insert mode before current position
    a - insert mode after current position
    o - insert line below current and enter insert mode
    O - insert line above current and enter insert mode
    I - jump to first blank character of current line and switch to insert mode
    A - jumb to last charachter of current line and switch to insert mode

    d - delete from cursor to position given by next command (ex. d$)
    dd - delete the current line
    D - delete rest of the current line
    c - same as d but enters insert mode after
    x - delete character under cursor
    X - delete character before cursor (Backspace)
    y - copy characters from cursor to position given by next command
    yy - yank the current line
    Y - yank the current line
    p - paste after cursor
    P - paste before cursor
    ]p - paste with auto-indentation
    s - substitute from cursor to position given by next command
    S - substitue line
    Ctrl-y - copy chars from line above (in insert mode)
    Ctrl-e - copy chars from line below (in insert mode)
    . - repeat last insertion or editing command
    "ayy - "yank" the current line into register "a".
    "ap - paste register "a"
    :registers - show registers

    u - undo
    Ctrl-r - redo

    v - visual mode (character oriented)
    V - visual mode (line oriented)
    Ctrl-v - block visual mode (select rectangles of text)
    o (while selecting) - moves cursor to other corner of selection

    :!command - execute the external command and show the output
    :r!command - execute the external command and insert the output

Together with the selection commands you can use:

    iw - inner word
    aw - a word
    iW - inner WORD
    aW - a WORD
    etc.

    >> - indent the highlighted text
    << - un-indent the highlighted text

Make a selection (multiple rows) with Ctrl-v and then hit "I". The text you
insert will be inserted for each row when you exit insert mode.

    With Ctrl-v$ you can add text to the end of lines.

## Search, Replace, Autocomplete
    / - search forward
    ? - search backward
    n - repeat search in current search direction
    N - repeat search in the opposite to the current search direction

    :%s/old/new/gc - replace string in whole file, asking for confirmation
    :s/old/new/g - replace string in selection

    Ctrl-p - autocompletion (word, insert mode)
    Ctrl-x - autocompletion (line, insert mode)
    Ctrl-l - autocompletion (line, insert mode)

## Marks (jump points)
    m{a-Z} - set mark (a-z this file, A-Z available over sessions)
    '{a-Z} - jump to mark (also works with `{a-Z}
    '' - back to position before jump

## Windows, Buffers & Tabs
    :new - new window
    :q - close current window (close vim if last)
    :sp <filename> - split window horizontally
    :vsp <filename> - split window vertically
    :(v)sp N - split window, edit buffer N
    Ctrl-w {hjkl} - move between windows
    :on - close all windows but the active one (Ctrl-W o)

    :buffers - show buffer list
    :b N - switch to buffer N
    :bd - unload current buffer (remove from bufferlist)
    :bun - unload the buffer (leave in bufferlist)
    :w - write current buffer do disk
    :e - load file into buffer

    :tabnew - create new tab
    :tabe filename - open filename in a new tab
    gt - switch between tabs

## Folds

  zf[region] - creates a fold
  zR - open all folds
  zM - close all folds
  zo - open fold at cursor
  zO - open all folds at cursor
  zc - close fold at cursor
  zd - delete the fold at cursor
  zE - delete all folds
  [z - move to start of open fold
  ]z - move to end of open fold

## Macros
    q{0-9,a-Z} - start recording macro (stop by hitting q again)
    @a - replay the macro "a"
    @@ - repeat last played macro (ie. keep @ pressed to repeat multiple times)


# Credits

* [Tim Pope](https://github.com/tpope) that writes the most awesome vim scripts/plugins. Ever.
* [Steve Francia](https://github.com/spf13) from whom I got the idea of organizing my .vimrc file in nested folds. I also shamelessly borrowed heavily from his [installation script](https://github.com/spf13/spf13-vim/blob/3.0/bootstrap.sh) and am using a couple of his plugins.
* [Björn Tillenius](https://launchpad.net/~bjornt) that first introduced me to vim many years ago!

