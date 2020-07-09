# Ubuntu Server Setup Guide

## Add swap file
  * $ sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
  * $ sudo /sbin/mkswap /var/swap.1
  * $ sudo /sbin/swapon /var/swap.1
  * $ sudo swapon -s
  * $ sudo vim /etc/fstab
    ```
    /var/swap.1 swap swap defaults 0 0
    ```

## Generate user ssh key && Add athorized_keys
  * $ sudo apt-get install openssh-server
  * $ ssh-keygen -t rsa -C user@servername
  * $ cat /tmp/mykey.pub >> .ssh/authorized_keys
  * $ chmod 600 .ssh/authorized_keys

## Change root & user password
  * $ sudo apg-get install pwgen
  * $ pwgen
  * $ sudo su -
  * $ passwd root
  * $ passwd ubuntu

## Update System
  * $ sudo apt-get update && sudo apt-get upgrade
  * install linux kernel files
    - $ sudo apt-get install linux-headers-generic linux-headers-virtual linux-image-virtual linux-virtual
  * $ sudo apt-get autoremove

## Install development packages
  * sudo apt-get install git-gui tig tree git-flow build-essential autoconf automake zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev sqlite3 libtool pkgconf nodejs libcurl4-openssl-dev vim gnupg2

## Setup git configuration
  * $ git config --global user.name user
  * $ git config --global user.email user@servername
  * $ git config --global core.editor vim
  * $ git config --global color.ui true

## Install RVM
  * $ gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  * $ \curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles

## Install Ruby
  * $ rvm list known
  * $ rvm install ruby --disable-install-doc

## Install Rails
### Install Yarn
  * https://yarnpkg.com/lang/en/docs/install/
    - $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    - $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    - $ sudo apt update && sudo apt install yarn
    - $ yarn --version

### Install Rails laest
  * $ vi ~/.gemrc
    ```
    gem: --no-ri --no-rdoc --no-document
    ```
  * $ gem install rails

## Setup Vim
  * $ git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
  * $ vim ~/.vimrc
  ```
" Vundle Enable vimrc
set nocompatible             " not compatible with the old-fashion vi mode
filetype off                 " required!
"
" Setting up Vundle - the vim plugin bundler
"let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.Vim/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone http://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.Vim
"   let iCanHazVundle=0
endif
"
" Enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim
"
" Let Vindle manage Plugins
call vundle#begin()
"
" Let Vindle manage Vundle - start
Plugin 'VundleVim/Vundle.vim'
"
" My Bundles here:
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
  "Plugin 'vim-airline/vim-airline'
  "Plugin 'vim-airline/vim-airline-themes'
  "Plugin 'powerline/powerline'
	"Plugin 'maksimr/vim-jsbeautify'
	"Plugin 'vimwiki/vimwiki'
	"Plugin 'tpope/vim-surround'
	"Plugin 'Yggdroot/indentLine'
  "Plugin 'altercation/vim-colors-solarized'
"
" Let Vindle manage Plugins - end
call vundle#end()
"
" General
filetype plugin indent on
"
"smart ident HTML "filetype ident on
"set filetype=HTML
"set smartident
"gg=G
"
syntax on
"syntax enable
"
" Set colorscheme
"if has("termguicolors")
" fix bug for vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
" enable true color
set termguicolors
set background=dark
"set background=light
colorscheme solarized8_flat
"else
"	set background=dark
" set background=light
"colorscheme solarized
"endif
"
set ruler
set hlsearch
set nu
"
"Ruby env
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
"
"Python env
"set textwidth=79  " lines longer than 79 columns will be broken
"set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
"set tabstop=4     " a hard TAB displays as 4 columns
"set expandtab     " insert spaces when hitting TABs
"set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
"set shiftround    " round indent to multiple of 'shiftwidth'
"set autoindent    " align the new line indent with the previous line
"
" define OpenURL (OSX)
":command -bar -nargs=1 OpenURL :!open <args>
"
" define OpenURL (Linux)
:command -bar -nargs=1 OpenURL :!firefox <targs>
" define OpenURL (Windows)
":command -bar -nargs=1 OpenURL :!start cmd /cstart /b <args>
"
" Command Alias
cnoreabbrev rc e $MYVIMRC
cnoreabbrev rl so $MYVIMRC
cnoreabbrev dk set background=dark
cnoreabbrev lt set background=light
" cnoreabbrev cs colorscheme
"
" Map keys
" Force myself to not to use the error keys
map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
" Key Replace
nmap <leader>s :w<cr>
nmap <leader>q :q!<cr>
nmap <leader>f <C-f>
nmap <leader>b <C-b>
nmap <leader>d <C-d>
nmap <leader>u <C-u>
nmap <leader>r <C-r>
nmap <leader>w <C-w>w
nmap <leader>e :shell<cr>
  ```
  * $vim
  ```
	:PluginInstall
  ```

## Install Rails Test Site
### First site
  * $ rails new rails6032
  * $ cd rails6032
  * $ bundle
  * $ rails webpacker:install
  * $ vim config/environments/development.rb
  ```
   Rails.application.configure do
   # Whitelist one hostname
   config.hosts << "ubt.domain.org"
  ```
  * rails server -b 0.0.0.0

### Sample site
  * $  rails generate controller pages
  * $  vim app/controllers/pages_controller.rb
  ```
  require 'socket'
  class PagesController < ApplicationController
    def about
      @rails_ver = Rails.version
      @ruby_ver = RUBY_VERSION
      @env = Rails.env
      @hostname = Socket.gethostname
      @ip_addr = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
      @remote_ip= request.remote_ip
      @current_time = Time.current
    end
  end
  ```
  * $ vim app/views/pages/about.html.erb
  ```
  <Center>
  <H1>Hello Rails!</H1>
  <P/>
  <H3>Ruby Version:</H3>
  <%= @ruby_ver %>
  <P/>
  <H3>Rails Version:</H3>
  <%= @rails_ver %>
  <P/>
  <H3>Environment:</H3>
  <%= @env %>
  <P/>
  <H3>Host Name:</H3>
  <%= @hostname %>
  <P/>
  <H3>Host IP:</H3>
  <%= @ip_addr %>
  <P/>
  <H3>Remote IP:</H3>
  <%= @remote_ip %>
  <P/>
  <H3>Time:</H3>
  <%= @current_time %>
  <P/>
  </Center>
  ```
  * $ vim config/routes.rb
  ```
  get "/about" => "pages#about"
  root "pages#about"
  ```
  * $ rails server -b 0.0.0.0

## Install Apache
  * $ gem install passenger
  * $ sudo apt-get install apache2 apache2-dev apache2-mpm-prefork
  * $ passenger-install-apache2-module  (change ruby version need to re-execute once)
  * $ sudo vim /etc/apache2/mods-available/rails.load  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  * $ sudo vim /etc/apache2/mods-available/rails.conf  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  * $ sudo vim /etc/apache2/sites-available/001-rails.conf (new file)

  * $ vim rails.load
  ```
	LoadModule passenger_module /home/ubuntu/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.24/buildout/apache2/mod_passenger.so
  ```
  * $ vim rails.conf
  ```
	PassengerRoot /home/ubuntu/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.24
  PassengerDefaultRuby /home/ubuntu/.rvm/gems/ruby-2.2.1/wrappers/ruby
  ```

  * $ vim 001-rails.conf
  ```
  <VirtualHost *:80>
    #ServerName www.example.com
    ServerAdmin webmaster@localhost
    DocumentRoot /home/ubuntu/sites/rails-site/public
    <Directory /home/ubuntu/sites/rails-site/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
        #Order allow,deny
        #Allow from all
        #AllowOverride all
        #Options -MultiViews
    </Directory>
    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn
    ErrorLog ${APACHE_LOG_DIR}/rails_error.log
    CustomLog ${APACHE_LOG_DIR}/rails_access.log combined
    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
  </VirtualHost>
  # vim: syntax=apache ts=4 sw=4 sts=4 sr noet
  ```

  * $ rvmsudo passenger-config validate-install
  * $ rvmsudo passenger-memory-stats
  * $ sudo a2enmod rails
  * $ sudo a2ensite 001-rails
  * $ sudo apache2ctl stop
  * $ sudo apache2ctl start
