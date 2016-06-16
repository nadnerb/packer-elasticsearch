#!/usr/bin/env bash

set -e

cd /tmp
curl -L -o elastic.rpm https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/${ELASTIC_VERSION}/elasticsearch-${ELASTIC_VERSION}.rpm
sudo rpm -Uvh elastic.rpm
rm elastic.rpm

cd /usr/share/elasticsearch
sudo chown elasticsearch:elasticsearch -R .

# install aws plugin
sudo yum install -y expect

ls -al /tmp/awsplugin.sh
echo "chmod awsplugin"
sudo chmod +x /tmp/awsplugin.sh
echo "running aws plugin"
/tmp/awsplugin.sh
echo "done running aws plugin"


sudo sed -i 's/#MAX_LOCKED_MEMORY=unlimited/MAX_LOCKED_MEMORY=unlimited/' /etc/sysconfig/elasticsearch
