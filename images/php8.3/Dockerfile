FROM johnea/php-fpm:8.3-work

RUN apt update && apt install zlib1g-dev nano git -y
RUN cd /usr/lib && git clone https://github.com/NoiseByNorthwest/php-spx.git
RUN cd /usr/lib/php-spx && phpize && ./configure --with-zlib=DIR && make && make install