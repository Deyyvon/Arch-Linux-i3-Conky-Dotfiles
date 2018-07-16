" Set Runtime path
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Syntax highlighting
filetype plugin indent on

" Automatically indent if in indent block
set autoindent

" Detect code syntax
syntax on

" Turn on line numbers
set number

" Enable mouse clicking
set mouse=a

" Set clipboard to system
set clipboard=unnamedplus

" Tab length
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Return to last editing position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif

" Copy/paste/cut shortcuts
vmap <C-c> "+yi
vmap <C-x> "+c
map <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Rewrite as root
command W w !sudo tee %<CR>

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Use Pathogen plugin/runtime path manager
execute pathogen#infect()

" LaTeX Version
let g:tex_flavor = "latex"

" Arduino configuration
let g:arduino_dir = '/usr/share/arduino'	" Path to 'arduino' directory
let g:arduino_args = '--verbose-upload'		" Verbose output during upload
let g:arduino_board = 'arduino:avr:uno'		" Board type to use when compiling/uploading
let g:arduino_programmer = 'arduino:usbtinyisp'	" Programmer type to use when compuling/uploading
let g:arduino_serial_cmd = 'screen {port} {baud}' " Command to connect to serial for debugging
let g:arduino_serial_baud = 9600		" Baud rate for serial connection
let g:arduino_auto_baud = 1			" Auto set the baud by searching for 'Serial.begin()'
let g:arduino_serial_tmux = 'split-window -d'	" If in tmux, invoke inside tmux command
let g:arduino_serial_port = '/dev/ttyACM0'	" Set default serial port
let g:arduino_serial_port_globs = ['/dev/ttyACM*',
				\'/dev/ttyUSB*',
				\'/dev/tty.usbmodem*',
				\'/dev/tty.usbserial*'] " Search patterns for likely serial port

" Arduino Commands
"
" :ArduinoChooseBoard <board>		Set currently selected board in the
"					format 'package:arch:board[:parameters]'
"					(Set shortcut: '\ab')
" :ArduinoChooseProgrammer <programmer> Set programmer of current board in the
"					format 'package:programmer' (Set
"					shortcut: '\ap')
" :ArduinoChoosePort <port>		Set currently selected serial port. No
" 					arguments gives a list.
" :ArduinoVerify			Compile current project. (Set
" 					shortcut: '\av')
" :ArduinoUpload			Upload current project to Arduino.
" 					(Set shortcut: '\au')
" :ArduinoSerial			Open a serial port connection. (Set
" 					shortcut: '\as')
" :ArduinoUploadAndSerial		Compile, upload, and open serial. (Set
" 					shortcut: '\ad')
"
" Arduino shortcuts configured in ~/.vim/bundle/vim-arduino/ftplugin/arduino.vim
" Arduino Boards:
" 	archlinux-arduino:avr:mega:cpu=atmega2560
" 	archlinux-arduino:avr:uno

if $DISPLAY != ""
	" Powerline status bar
	let g:powerline_pycmd="py3"
	set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim

	" Always show statusline
	set laststatus=2

	" Use 256 colours (Use this setting only if your terminal supports 256 colours)
	set t_Co=256

	let g:airline_powerline_fonts = 1
	let g:airline_skip_empty_sections = 1
	let g:airline_theme='cyber'
else
	let g:powerline_loaded = 1
endif
