" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
" Notes {
"   This is the personal .vimrc file of Daniel Jonasson.
"   It's a part of my vim installation that can be found at:
"   https://github.com/djonasson/djonasson-vim
" }

" Environment {

  " Basics {

    " The set nocompatible setting makes vim behave in a more useful way (the
    " default) than the vi-compatible manner. Remove the “no” to keep the
    " old vi behavior. Must be the first line since it changes other settings.
    set nocompatible

    " Assume a dark background
    set background=dark

    " Setup the mapleader. This is a variable that we can use when defining
    " shortcuts by inserting <leader>. It's a backslash by default but many
    " people prefer to change it to a comma that is more easily reached from
    " your default position.
    let mapleader = ","

  " }

  " Setup Vundle (Vim bUNDLE) support {

    " Disable automatic file type detection. We will later re-enable file-type
    " detection so don't worry...
    " REQUIRED for vundle
    filetype off

    " We use Vundle to handle our plugins.
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

  " }

" }

" Bundles {

  " Dependencies {

     " Vundle {

       " We use vundle to handle updates of itself.
       " REQUIRED for vundle
       Bundle 'gmarik/vundle'

       " Help {
         " :BundleList          - list configured bundles
         " :BundleInstall(!)    - install(update) bundles
         " :BundleSearch(!) foo - search(or refresh cache first) for foo
         " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
         "
         " see :h vundle for more details or wiki for FAQ
       " }

     " }

     " Local bundles {

       " Use local bundles if available {
         if filereadable(expand("~/.vimrc.bundles.local"))
           source ~/.vimrc.bundles.local
         endif
       " }

       " In your .vimrc.bundles.local file, list only the plugin groups you will use {
         if !exists('g:djonasson_bundle_groups')
           let g:djonasson_bundle_groups=['general', 'vcs', 'programming', 'php', 'ruby', 'rails', 'python', 'javascript', 'html', 'misc']
         endif
       " }

    " }

  " }

  " Optional Bundles {

    " To override all the included bundles, put:
    " g:override_djonasson_bundles = 1
    " in your .vimrc.bundles.local file"
    if !exists("g:override_djonasson_bundles")

      " General {
        if count(g:djonasson_bundle_groups, 'general')

          " NERDtree: A tree explorer plugin for vim. {
            Bundle 'scrooloose/nerdtree'
            " Customizations {
              " Commented out since it's handled better by the vim-nerdtree-tabs plugin.
              "map <F12> :NERDTreeToggle<CR>
            " }
          " }

          " NERDtree-tabs: NERDTree and tabs together in Vim, painlessly {
            Bundle 'jistr/vim-nerdtree-tabs'
            " Customizations {
              map <F11> <plug>NERDTreeTabsToggle<CR>
              map <F12> <plug>NERDTreeMirrorToggle<CR>
              let g:nerdtree_tabs_open_on_gui_startup = 0
              let g:nerdtree_tabs_open_on_console_startup = 0
              let g:nerdtree_tabs_smart_startup_focus = 1
              let g:nerdtree_tabs_open_on_new_tab = 1
              let g:nerdtree_tabs_meaningful_tab_names = 1
              let g:nerdtree_tabs_autoclose = 1
              let g:nerdtree_tabs_synchronize_view = 1
              let g:nerdtree_tabs_focus_on_files = 0
            " }
          " }

          " surround.vim: Quoting/parenthesizing made simple
          Bundle 'tpope/vim-surround'

          " vim-fuzzyfinder: Fuzzy/Partial pattern explorer for buffer/file/MRU/command/bookmark/tag/etc. {
            Bundle 'clones/vim-fuzzyfinder'
            Bundle 'clones/vim-l9'
            " Customizations {
              map <leader>F :FufFile<CR>
              map <leader>f :FufTaggedFile<CR>
              map <leader>s :FufTag<CR>
            " }
          " }

          " vim-supertab: Supertab aims to provide tab completion to satisfy all your insert completion needs (:help ins-completion).
          Bundle 'tsaleh/vim-supertab'

          " An impressive collection of color schemes but it creates a
          " conflict with the railscasts color schema I prefer to use so I've
          " commented it out for now.
          "Bundle 'flazz/vim-colorschemes'

          " This plugin for Vim enable an auto-close chars feature for you. For
          " instance if you type an '(', ``autoclose`` will automatically
          " insert a ')' and put the cursor between
          "Bundle 'AutoClose'

          " Fuzzy file, buffer, mru and tag finder {
            Bundle 'kien/ctrlp.vim'
            " Help {
              " Ctrl-p - start search
              " Once search open:
              " Ctrl-d - filename only search
              " Ctrl-r - regexp mode
              " Ctrl-y - create a new file with parent directories
              " Ctrl-z - mark/unmark files, Ctrl-o to open them
              " F5 - purge cache
            " }
          " }

          " Vim provides a ':mksession' command to save the current editing session.
          Bundle 'vim-scripts/sessionman.vim'

          " Powerline is a utility plugin which allows you to create
          " better-looking, more functional vim statuslines.
          Bundle 'Lokaltog/vim-powerline'

          " EasyMotion provides a much simpler way to use some motions in vim {
            Bundle 'Lokaltog/vim-easymotion'
            " Help {
              " Triggered by <leader><leader>
              " For example, to search for the letter 'o':
              " <leader><leader>fo
              " Or by word:
              " <leader><leader>w
            " }
          " }

          " Make gvim-only colorschemes work transparently in terminal vim
          Bundle 'godlygeek/csapprox'

          " BufOnly: Delete all the buffers except the current/named buffer
          Bundle 'vim-scripts/BufOnly.vim'

          " loremipsum: Insert a dummy text of a certain length.
          Bundle 'vim-scripts/loremipsum.git'

          " minibufexpl: Elegant buffer explorer - takes very little screen space {
            Bundle 'fholgado/minibufexpl.vim'
            " Customizations {
              let g:miniBufExplUseSingleClick = 1
              let g:miniBufExplMapCTabSwitchBufs = 1
              let g:miniBufExplMapWindowNavVim = 1
              let g:miniBufExplMaxSize = 2
            " }
          " }

          "" matrix.vim: A matrix inspired colorscheme. {
          "  Bundle 'matrix.vim'
          "" }

          "" matrix.vim--Yang: A matrix inpired screensaver {
          "  Bundle 'matrix.vim--Yang'
          "" }

          " ack.vim: This plugin will allow you to run ack from vim, and shows the results in a split window. {
            Bundle 'mileszs/ack.vim'

            " Help {
              " :Ack [options] {pattern} [{directory}]
            " }
          " }

        endif
      " }

      " VCS {
        if count(g:djonasson_bundle_groups, 'vcs')

          " vim-fugitive: a Git wrapper so awesome, it should be illegal {
            Bundle 'tpope/vim-fugitive'

            " Help {

              " View any blob, tree, commit, or tag in the repository with :Gedit,
              " :Gsplit, :Gvsplit, :Gtabedit
              "
              " :Gstatus - Show git status. Use '-' to add/reset a file's changes or
              " 'p' to add/reset --patch
              "
              " :Gcommit - git commit
              "
              " :Gdiff - bring up the staged version of the file side by side with the
              " working tree version and use Vim's diff handling capabilities to stage
              " a subset of the file's changes
              "
              " :Gblame - interactive vertical split with git blame output. Press enter
              " on a line to reblame the file as it stood in that commit, or o to open
              " that commit in a split. When you're done, use :Gedit in the historic
              " buffer to go back to the work tree version.
              "
              " :Gmove - does a git mv on a file and simultaneously renames the buffer.
              "
              " :Gremove - does a git rm on a file and simultaneously deletes the
              " buffer.
              "
              " :Ggrep - search the work tree (or any arbitrary commit) with git grep,
              " skipping over that which is not tracked in the repository.
              "
              " :Glog - loads all previous revisions of a file into the quickfix list
              " so you can iterate over them and watch the file evolve!
              "
              " :Git - run any arbitrary command.
              "
              " :Git! - open the output of a command in a temp file.
              "
              " More help can be found here:
              " https://github.com/tpope/vim-fugitive

            " }
          " }

          " SCMDiff: Highlight changed lines in a file via SCM diff command.  {
            Bundle 'SCMDiff'

            " Customizations {
              " Use git as default
              let g:SCMDiffCommand='git'
            " }

            " Help {
              " It allows you to quickly toggle (through a keybinding, Ctrl-D
              " by default) the highlighting of changed lines in a file through
              " an SCM's diff command.
              "
              " It also binds Ctrl-G to :set nodiff to quickly turn off the
              " highlighting.
              "
              " The original script was written for git, but this version works
              " for (at least) Mercurial and Subversion as well.  CVS and
              " Perforce likely work but have not been tested.
              "
              " It likely only works on Unix systems, or at least systems with
              " 'cat' and 'patch', in addition to the SCM's command.
              "
              " Configuration consists of the variable g:SCMDiffCommand, which
              " if not set will be set to 'svn', assuming Subversion.
              " If g:SCMDiffCommand is set to 'hg', it works for Mercurial,
              " and likewise 'git' for git.
            " }
          " }

        endif
      " }

      " Programming {
        if count(g:djonasson_bundle_groups, 'programming')

          " vim-commentary - comment stuff out
          Bundle 'tpope/vim-commentary.git'

          " syntastic: Syntax checking hacks for vim {
            Bundle 'scrooloose/syntastic'
            " Customizations {
              let g:syntastic_enable_signs=1
              let g:syntastic_auto_loc_list=2
            " }
          " }

          " vim-snipmate: aims to be a concise vim script that implements some of TextMate's snippets features in Vim. {
            " Dependencies {
              Bundle "MarcWeber/vim-addon-mw-utils"
              Bundle "tomtom/tlib_vim"
              Bundle "snipmate-snippets"
            " }
            Bundle "garbas/vim-snipmate"
          " }

          " nerdcommenter: vim global plugin that provides easy code commenting
          Bundle 'scrooloose/nerdcommenter'

          " tabular: Configurable, flexible, intuitive text aligning. {
            Bundle 'godlygeek/tabular'
            " Help {
              " Make a table with a comma as a column separator
              " :Tabularize /,
              " Make the same table with columns right aligned and no padding
              " :Tabularize /,/r0
              " :Tab is a shortcut for :Tabularize
              " right align the text before the comma, and left align the text after the comma
              " after the comma
              " :Tabularize /,/r1c1l0
              " :help Tabular.txt
            " }
          " }

          " tagbar - Vim plugin that displays tags in a window, ordered by class etc. {
            Bundle 'majutsushi/tagbar'

            " Customizations {
              nmap <F8> :TagbarToggle<CR>
            " }

            " Help {
              " Use F8 to toggle the tagbar
            " }
          " }

          " Neocomplcache performs keyword completion by making a cache of
          " keywords in a buffer.
          Bundle 'Shougo/neocomplcache'

          " HTML {
            if count(g:djonasson_bundle_groups, 'html')

              Bundle 'HTML-AutoCloseTag'
              Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

            endif
          " }

          " Javascript {
            if count(g:djonasson_bundle_groups, 'javascript')

              Bundle 'leshill/vim-json'
              Bundle 'groenewege/vim-less'
              Bundle 'taxilian/vim-web-indent'

            endif
          " }

          " Misc {
            if count(g:djonasson_bundle_groups, 'misc')

              Bundle 'spf13/vim-markdown'

              " Preview plugin is a tool developed to help you to preview
              " markup files such as .markdown, .rdoc, .textile and .html when
              " you are editing them. It builds html files and opens them in
              " your browse. {
                Bundle 'spf13/vim-preview'

                " Help {
                  " <leader>P - open the current document, converted to HTML,
                  " in your browser.
                " }
              " }

            endif
          " }

          " PHP {
            if count(g:djonasson_bundle_groups, 'php')

              " PIV: PHP Integration for VIM
              Bundle 'spf13/PIV'

            endif
          " }

          " Python {
            if count(g:djonasson_bundle_groups, 'python')

              Bundle 'klen/python-mode'
              Bundle 'python.vim'
              Bundle 'python_match.vim'
              Bundle 'pythoncomplete'

            endif
          " }

          " Ruby {
            if count(g:djonasson_bundle_groups, 'ruby')

              " endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
              Bundle 'tpope/vim-endwise'

              Bundle 'tpope/vim-cucumber'

              " Ruby on Rails {
                if count(g:djonasson_bundle_groups, 'rails')

                  " vim-rails: Ruby on Rails power tools
                  Bundle 'tpope/vim-rails.git'

                  " vim-haml: Vim runtime files for Haml, Sass, and SCSS
                  Bundle 'tpope/vim-haml.git'

                  " Railscasts-Theme-GUIand256color: A railscasts color theme that works in 256color terminals as well as gui
                  Bundle 'vim-scripts/Railscasts-Theme-GUIand256color'

                endif
              " }

            endif
          " }

        endif
      " }

    endif

  " }

" }

" General {

  " Auto-detect the filetype.
  " REQUIRED for vundle
  filetype plugin indent on

  " allow to change buffers although the current one hasn't been saved
  set hidden

  " Stop vim from asking if you want to write the file before leaving buffer
  set autowrite

  " syntax highlight
  syntax on

  " always switch to the current file directory.
  "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

  " have Q reformat the current paragraph (or selected text if there is any):
  nnoremap Q gqap
  vnoremap Q gq

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " 1000 undo levels
  set undolevels=1000

  " Remove trailing white-spaces with F5
  :nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

  " Make Y consistent with C and D (copy from cursor to the end of the line)
  nnoremap Y y$

  " ack-grep
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"

  " Move current row up/down with Alt-k/Alt-j
  " Works both in normal and insert modes.
  nnoremap <A-j> :m+<CR>==
  nnoremap <A-k> :m-2<CR>==
  inoremap <A-j> <Esc>:m+<CR>==gi
  inoremap <A-k> <Esc>:m-2<CR>==gi
  vnoremap <A-j> :m'>+<CR>gv=gv
  vnoremap <A-k> :m-2<CR>gv=gv

" }

" Visual Improvements {

  "Highlight trailing whitespace
  set list listchars=trail:.
  highlight SpecialKey ctermfg=DarkGray

  "Differentiate tabs from spaces
  set list listchars=tab:\|_,trail:.

  " Higlight current line
  " I've commented it out for the moment since it makes it noticeably slower
  " to move between lines.
  "set cursorline

  " show line numbers
  "set number

  " Remove the icon menu
  set guioptions-=T

  " Remove the main menu
  set guioptions-=m

  " Choose theme based upon terminal type
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    :silent! colorscheme railscasts
  else
    :silent! colorscheme desert
  endif

  " Set the default font
  set gfn=DejaVu\ Sans\ Mono\ 8

  " Commandline setup {
    if has('cmdline_info')
      " show the ruler
      set ruler
      " a ruler on steroids
      set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
      " show partial commands in status line and selected characters/lines in visual mode
      set showcmd
    endif
  " }

  " Statusline setup {
    if has('statusline')
      set laststatus=2

      " Broken down into easily includeable segments
      " Filename
      set statusline=%<%f\
      " Options
      set statusline+=%w%h%m%r
      " Git
      set statusline+=%{fugitive#statusline()}
      " filetype
      set statusline+=\ [%{&ff}/%Y]
      " current dir
      set statusline+=\ [%{getcwd()}]
      " Right aligned file nav info
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%
    endif
  " }

" }

" Searching {
  " start searching immediately when using /something
  set sm

  " Incrementally jump to the search result
  set incsearch

  " Highlight search results
  set hlsearch

  " ignore case while searching
  set ignorecase
" }

" Spell checking {
  " Spell check when writing commit logs
  autocmd filetype svn,*commit* setlocal spell
" }

" Tabs and Indentation {
  " Wrap too long lines
  set wrap

  " Tabs are 2 characters
  set tabstop=2

  " (Auto)indent uses 2 characters
  set shiftwidth=2

  " spaces instead of tabs
  set expandtab

  " guess indentation
  set autoindent
" }

" Key re-mappings {

  " Code folding options
  nmap <leader>f0 :set foldlevel=0<CR>
  nmap <leader>f1 :set foldlevel=1<CR>
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>

  " Clearing highlighted search
  nmap <silent> <leader>/ :nohlsearch<CR>

" }

" Backup {
  " We backup to the ~/.vim/backup and ~/.vim/tmp folders instead of to the
  " current directory.
  set backup
  function InitBackupDir()
    let separator = "."
    let parent = $HOME .'/' . separator . 'vim/'
    let backup = parent . 'backup/'
    let tmp    = parent . 'tmp/'
    if exists("*mkdir")
      if !isdirectory(parent)
        call mkdir(parent)
      endif
      if !isdirectory(backup)
        call mkdir(backup)
      endif
      if !isdirectory(tmp)
        call mkdir(tmp)
      endif
    endif
    let missing_dir = 0
    if isdirectory(tmp)
      execute 'set backupdir=' . escape(backup, " ") . "/,."
    else
      let missing_dir = 1
    endif
    if isdirectory(backup)
      execute 'set directory=' . escape(tmp, " ") . "/,."
    else
      let missing_dir = 1
    endif
    if missing_dir
      echo "Warning: Unable to create backup directories: " . backup ." and " . tmp
      echo "Try: mkdir -p " . backup
      echo "and: mkdir -p " . tmp
      set backupdir=.
      set directory=.
    endif
  endfunction
  call InitBackupDir()
" }

" File handling and navigation {

  " Expand the command line using tab
  set wildchar=<Tab>

  " show list instead of just completing
  set wildmenu

  " show matching files list when using :e etc. don't use greedy matching.
  set wildmode=longest,list

  " When editing a file, always jump to the last known cursor position. Don't
  " do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Let vim know that .prawn files are actually ruby files.
  au BufNewFile,BufRead *.prawn set filetype=ruby

" }

" Rails {

  let g:browser = 'firefox -new-tab '

  " Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab {
    function! OpenRubyDoc(keyword)
      let url = 'http://apidock.com/ruby/'.a:keyword
      exec '!'.g:browser.' '.url.' &'
    endfunction
    noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>
  " }

  " Open the Rails ApiDock page for the word under cursor, in a new Firefox tab {
    function! OpenRailsDoc(keyword)
      let url = 'http://apidock.com/rails/'.a:keyword
      exec '!'.g:browser.' '.url.' &'
    endfunction
    noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>
  " }

" }

" Use gvimrc if available and gui is running {
  if has('gui_running')
    if filereadable(expand("~/.gvimrc"))
      source ~/.gvimrc
    endif
  endif
" }

" Use local vimrc if available {
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }

" Use local gvimrc if available and gui is running {
  if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
      source ~/.gvimrc.local
    endif
  endif
" }

set t_Co=256
