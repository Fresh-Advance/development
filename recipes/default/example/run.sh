#!/bin/bash

SCRIPT_PATH=$(dirname ${BASH_SOURCE[0]});
ROOT_PATH="$SCRIPT_PATH/../../..";

make reset
make setup
make addbasicservices

test -d $ROOT_PATH/source || (mkdir -p $ROOT_PATH/source && cp -r $SCRIPT_PATH/examples/* $ROOT_PATH/source/)

make up

docker compose exec -T php composer update --no-interaction

echo "Done!"