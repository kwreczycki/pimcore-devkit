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
cp $TRAVIS_BUILD_DIR/misc/config/system.php $TRAVIS_BUILD_DIR/var/config/system.php

##########################################################################################
#########
#########  Install composer dependencies
#########
##########################################################################################

COMPOSER_MEMORY_LIMIT=-1 composer req doctrine/instantiator:1.0.5 --no-interaction --no-scripts
COMPOSER_MEMORY_LIMIT=-1 composer install -o

##########################################################################################
#########
#########  Install Pimcore
#########
##########################################################################################

vendor/bin/pimcore-install --ignore-existing-config --admin-username admin --admin-password admin123 --mysql-username travis --mysql-host-socket 127.0.0.1 --mysql-database pimcore_devkit_test
