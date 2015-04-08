#!/usr/bin/env bash

##############################################################
# Begin generic commands run across all roles
##############################################################

# Copy SSH keys for authentication
set -e

elasticsearch_version=$ELASTIC_VERSION

cd /tmp
curl -o elastic.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$elasticsearch_version.deb
sudo dpkg -i elastic.deb
rm elastic.deb
sudo update-rc.d elasticsearch defaults
#sudo mkdir /mnt/elasticsearch
#sudo chown elasticsearch:elasticsearch /mnt/elasticsearch

# aws cloud needs to be compatible with es version
# the following requires build from snapshots :/
#sudo apt-get -y install maven
#sudo apt-get -y install git
#git clone https://github.com/elastic/elasticsearch-cloud-aws.git
#cd elasticsearch-cloud-aws/

#git checkout es-1.5
# THIS DOWNLOADS THE INTERNET
#mvn clean install
#plugin --install cloud-aws \
#       --url file:target/releases/elasticsearch-cloud-aws-1.5.0-SNAPSHOT.zip

# previously uploaded
sudo mv /tmp/elasticsearch.yml /etc/elasticsearch/

cd /usr/share/elasticsearch
sudo chown elasticsearch:elasticsearch -R .
sudo bin/plugin -i elasticsearch/elasticsearch-cloud-aws/2.5.0
sudo bin/plugin -i elasticsearch/marvel/latest
