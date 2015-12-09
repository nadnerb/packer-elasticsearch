#!/bin/bash -eux

set -e

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.rpm"
sudo yum localinstall -y jdk-8u66-linux-x64.rpm

echo "Check installation"
java -version
javac -version
