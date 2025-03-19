#!/bin/sh
cd ~/devilbox/;
docker compose exec -it --user devilbox php /shared/httpd/vendor/bin/php-cs-fixer "$@";
