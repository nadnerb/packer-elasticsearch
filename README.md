Elastic Search AWS AMI with Packer
=============

Install [Packer](https://www.packer.io/) and add it to your PATH.

Create your elasticsearch AMI in AWS, using your access and secret keys.

This also installs [Consul](https://www.consul.io/). This will need to be configured separately as it would be a good
idea to join an existing consul cluster.

```
packer build \
  -var 'aws_access_key=your_key' \
  -var 'aws_secret_key=your_secret' \
  elastic.json
```

Or

```
packer build -var-file='path/to/packer_vars.json' elastic.json
```

Extra variables exposed:

* aws_region (defaults to `ap-southeast-2`)
* aws_instance_type (defaults to `t2.medium`)
* ami_name_prefix (defaults to `elasticsearch`)
* elastic_version (defaults to `2.3.0`)

###Troubleshooting

* Make sure you have set the AWS region and the correct source AMI (Ubuntu 14.x recommended) for that region
* There will no doubt be a few more issues.. hit us up

###TODO

* this README is possibly out of date
