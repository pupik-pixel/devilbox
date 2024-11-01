#!/bin/sh

docker exec -it -w /shared/backups/mysql devilbox-php-1 /bin/bash -c 'mysql -h mysql -u root YOUR_DATABASE < optimize_tables.txt';

echo 'WELL DONE';
