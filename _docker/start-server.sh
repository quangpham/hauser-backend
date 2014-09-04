#!/bin/bash

# Start mysql
sh /mysql_start.sh

#start rails
cd /rails
source /etc/profile.d/rvm.sh
bundle exec unicorn -D -p 8080
nginx
