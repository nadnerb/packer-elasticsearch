#!/usr/bin/env bash

set -e

elasticsearch_version=$ELASTIC_VERSION

cd /tmp
curl -o elastic.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$elasticsearch_version.deb
sudo dpkg -i elastic.deb
rm elastic.deb
sudo update-rc.d elasticsearch defaults

# previously uploaded
sudo mv /tmp/elasticsearch.yml /etc/elasticsearch/

cd /usr/share/elasticsearch
sudo chown elasticsearch:elasticsearch -R .
sudo bin/plugin -i elasticsearch/elasticsearch-cloud-aws/2.7.0
sudo bin/plugin -i elasticsearch/marvel/latest
