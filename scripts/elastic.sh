#!/usr/bin/env bash

set -e

# not used anymore.. will be upgrading to 2.1 asap
elasticsearch_version=$ELASTIC_VERSION

cd /tmp
curl -o elastic.rpm https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.noarch.rpm
sudo rpm -Uvh elastic.rpm
rm elastic.rpm

cd /usr/share/elasticsearch
sudo chown elasticsearch:elasticsearch -R .
sudo bin/plugin -i elasticsearch/elasticsearch-cloud-aws/2.7.0
#sudo bin/plugin -i elasticsearch/marvel/latest
#sudo bin/plugin -i mobz/elasticsearch-head

echo "elasticsearch health check"
mv /tmp/config/check.py /etc/consul.d/

echo "elasticsearch config"
sudo mkdir -p /etc/elasticsearch/configurable
mv /tmp/config/* /etc/elasticsearch/configurable
