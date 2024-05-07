#!/bin/bash

DEFAULT_USER=werner
DEFAULT_GROUP=www-data
HOME_DIR=/DATA/Projects/Laravel/simple_laravel_app-to_casaos

chown -R $DEFAULT_USER:$DEFAULT_GROUP $HOME_DIR
chmod -R o-rxw $HOME_DIR/*
chmod -R 0750 $HOME_DIR/node_modules

chmod 0770 $HOME_DIR/storage
find $HOME_DIR/storage -type d -exec chmod 0770 {} \;
find $HOME_DIR/storage -type f -exec chmod 0660 {} \;
setfacl --recursive --remove-all --remove-default $HOME_DIR/storage
setfacl --recursive --modify default:group:$DEFAULT_GROUP:rwx $HOME_DIR/storage

chmod 0770 $HOME_DIR/bootstrap/cache
find $HOME_DIR/bootstrap/cache -type d -exec chmod 0770 {} \;
find $HOME_DIR/bootstrap/cache -type f -exec chmod 0660 {} \;
setfacl --recursive --remove-all --remove-default $HOME_DIR/bootstrap/cache
setfacl --recursive --modify default:group:$DEFAULT_GROUP:rwx $HOME_DIR/bootstrap/cache
