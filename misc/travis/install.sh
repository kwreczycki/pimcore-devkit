#!/usr/bin/env bash
set -e

##########################################################################################
#########
######### Setup Mysql
#########
##########################################################################################

mysql --version
mysql -e "SET GLOBAL innodb_file_format=Barracuda;"
mysql -e "SET GLOBAL innodb_large_prefix=1;"
mysql -e "CREATE DATABASE pimcore_devkit_test CHARSET=utf8mb4;"

##########################################################################################
#########
#########  add config templates
#########
##########################################################################################
mkdir -p $TRAVIS_BUILD_DIR/var/config
cp $CS_HOME/misc/config/system.php var/config/system.php

##########################################################################################
#########
#########  Install composer dependencies
#########
##########################################################################################
COMPOSER_MEMORY_LIMIT=-1 composer req doctrine/instantiator:1.0.5 --no-interaction --no-scripts
COMPOSER_MEMORY_LIMIT=-1 composer install -o
