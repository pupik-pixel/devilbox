FROM johnea/php-fpm:8.3-work

RUN sudo apt update && sudo apt install nano -y

RUN sudo apt update && sudo apt install bzip2 -y

RUN sudo curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash

RUN mv ~/.local/bin/goose /usr/local/bin/

