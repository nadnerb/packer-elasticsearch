#!/usr/bin/expect -f
set timeout -1
echo awsplugin.sh executing
spawn sudo /usr/share/elasticsearch/bin/plugin install cloud-aws

expect "\[y\/N\]"
send "y\r"
expect "$ "
