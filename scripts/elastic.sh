#!/usr/bin/env bash

set -e

# not used anymore.. will be upgrading to 2.1 asap
elasticsearch_version=$ELASTIC_VERSION

cd /tmp
curl -L -o elastic.rpm https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/${ELASTIC_VERSION}/elasticsearch-${ELASTIC_VERSION}.rpm
sudo rpm -Uvh elastic.rpm
rm elastic.rpm

cd /usr/share/elasticsearch
sudo chown elasticsearch:elasticsearch -R .

# install aws plugin
sudo yum install -y expect
sudo chmod +x /tmp/config/awsplugin.sh
/tmp/config/awsplugin.sh

echo "elasticsearch health check"
mv /tmp/config/check.py /etc/consul.d/

echo "elasticsearch config"
sudo mkdir -p /etc/elasticsearch/configurable
mv /tmp/config/* /etc/elasticsearch/configurable
