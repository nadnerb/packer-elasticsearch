Elastic Search AWS AMI with Packer
=============

Install [Packer](https://www.packer.io/) and add it to your PATH.

Create your AMI in AWS, using your access and secret keys.

```
packer build \
	-var 'aws_access_key=your_key' \
	-var 'aws_secret_key=your_secret' \
	-var 'security_group_id=your_security_group \
	elastic.json
```

Extra variables exposed:

* aws_region (defaults to ap-southeast-2)
* aws_instance_type (defaults to t2.medium)
* ami_name_prefix (defaults to elasticsearch)
* elastic_version (defaults to 1.5.0)

###Troubleshooting

* Make sure you have set the aws region and the correct soure AMI (Ubuntu/Debian) for that region
* There will no doubt be a few more issues.. hit us up
