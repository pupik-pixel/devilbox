#!/bin/sh

#restart server
cd ~/devilbox;
docker compose stop;
docker compose rm -f;
docker compose up -d php httpd mysql bind;

#import db
scp your_user@your_domain:/path/to/backup/database.zip ~/devilbox/backups/mysql;
cd ~/devilbox/backups/mysql;
unzip -u database.zip;
rm database.zip;
echo 'updating db';
docker exec -it -w /shared/backups/mysql devilbox-php-1 /bin/bash -c 'mysql -h mysql -u root YOUR_DATABASE < database.sql';
rm database.sql;
echo 'WELL DONE';