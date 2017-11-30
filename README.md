Elastic Search AWS AMI with Packer
=============

>This has not been updated for sometime, the general gist of it should still apply.
>If anybody wants me to update it, please create an issue.

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

## Variables:

* aws_source_ami (defaults to none, please update)
* aws_access_key (defaults to none, please update)
* aws_secret_key (defaults to none, please update)
* aws_security_token (defaults to none)
* aws_region (defaults to `ap-southeast-2`)
* aws_instance_type (defaults to `t2.medium`)
* ami_name_prefix (defaults to `elasticsearch`)
* elastic_version (defaults to `2.3.0`)
* aws_build_regions (defaults to none)
* aws_instance_type (defaults to `t2.medium`)
* aws_vpc_id (defaults to none)
* aws_subnet_id (defaults to none)
* consul_version (defaults to `0.6.3`)
* consul_template_version (defaults to `0.12.1`)

###Troubleshooting

* Make sure you have set the AWS region and the correct source AMI (Amazon linux recommended) for that region

