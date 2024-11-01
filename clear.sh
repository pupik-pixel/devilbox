#/bin/sh
#@@@@@@@@@@@@@@@@@@@@@@@@@@
#        WARNING
#  CLEAR ALL DOCKER DATA 
#@@@@@@@@@@@@@@@@@@@@@@@@@@
docker compose stop;
docker compose rm -f;
docker volume prune --all;