#!/usr/bin/expect -f
set timeout -1
spawn sudo /usr/share/elasticsearch/bin/plugin install cloud-aws

expect "\[y\/N\]"
send "y\r"
expect "$ "
