FROM devilbox/php-fpm:8.2-work-0.150

RUN apt update && apt install zlib1g-dev nano -y
RUN cd /usr/lib && git clone https://github.com/NoiseByNorthwest/php-spx.git
RUN cd /usr/lib/php-spx && phpize && ./configure --with-zlib=DIR && make && make install



