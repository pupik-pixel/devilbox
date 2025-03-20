#!/bin/sh
docker exec devilbox-php-1 /shared/httpd/vendor/bin/php-cs-fixer "$@";
