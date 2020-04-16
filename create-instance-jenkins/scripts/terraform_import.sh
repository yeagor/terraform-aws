#!/bin/bash

echo Import existing Terraform resources...
terraform import aws_vpc.vpc                      vpc-62161018
terraform import aws_security_group.allow_jenkins sg-06538ce8dd3d0402e
terraform import aws_security_group.allow_ssh     sg-0679a0af95561313c
