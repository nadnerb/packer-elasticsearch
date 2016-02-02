#!/bin/bash -eux

set -e

wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jdk-8u71-linux-x64.rpm" -O jdk-8.rpm
yum localinstall -y jdk-8.rpm

echo "Check installation"
java -version
javac -version
