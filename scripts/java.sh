#!/bin/bash -eux

set -e

curl -L -o /tmp/jdk-8.rpm -b "oraclelicense=accept-securebackup-cookie"  "http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jdk-8u71-linux-x64.rpm"
yum localinstall -y /tmp/jdk-8.rpm

echo "Check installation"
java -version
javac -version
