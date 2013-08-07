#! /bin/sh

BASEDIR=$(dirname $0)
DEPLOY_DIR="/var/www-$1/emissary"
rsync -qrlpgoDz -c --delete $EXCLUDES --progress $BASEDIR $DEPLOY_DIR
cd $DEPLOY_DIR
pwd
case $1 in
  staging)
    ./runpaste-staging stop
    ./runpaste-staging start
  ;;
  production)
    ./runpaste stop
    ./runpaste start
  ;;
esac
