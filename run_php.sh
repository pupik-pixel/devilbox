#!/bin/sh
cd ~/devilbox/;
docker compose exec -it --user devilbox php php "$@";
