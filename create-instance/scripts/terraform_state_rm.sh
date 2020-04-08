#!/bin/bash

echo Resources to remove from Terraform state:
resources=(
  aws_security_group.allow_jenkins
  aws_security_group.allow_ssh
  aws_security_group_rule.allow_jenkins
  aws_security_group_rule.allow_jenkins-1
  aws_security_group_rule.allow_jenkins-2
  aws_security_group_rule.allow_jenkins-3
  aws_security_group_rule.allow_ssh
  aws_security_group_rule.allow_ssh-1
)
for resource in "${resources[@]}"
do
  echo \t"${resource}"
done
echo Removing resources from Terraform state...
for resource in "${resources[@]}"
do
  terraform state rm "${resource}"
done
