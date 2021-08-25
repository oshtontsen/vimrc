Vimrc File

Welcome to the "greatest" vimrc file ever. Get ready to increase
your productivity 100x's faster.

After cloning this repo, here are a couple steps to take to get fully set up:

    1. Download PlugInstall using the following command:
       $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    2. vim .vimrc
    3. :source .vimrc
    4. Install all Plug-ins from the internet using the following command:
       :PlugInstall
    5. Install Flake8 to enable linting:
       $ python -m pip install flake8
    6. Install Silver Surfer
       $ brew install ripgrep
    7. Install Black
       $ pip install black
Note that if PlugInstall command is not found, check whether git is installed on your machine. If not, then install it using yum install or apt-get.
