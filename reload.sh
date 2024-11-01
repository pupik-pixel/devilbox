#/bin/sh
cd ~/devilbox;
docker compose down;
docker compose up -d php httpd mysql bind;
