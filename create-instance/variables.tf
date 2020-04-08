variable profile {
  description = "AWS Profile"
}
variable region {
  description = "AWS Region"
}
variable bucket {
  description = "Terraform remote backend s3 bucket name"
}
variable env {
  description = "Environment name"
}
variable cidr_block {
  description = "Virtual Private Cloud CIDR. Supposed to be imported"
}
variable ami_jenkins {
  description = "Jenkins Amazon Machine Image ID"
}
variable instance_type {
  description = "Jenkins instance type"
  default     = "t2.micro"
}
variable pub_keys {
  description = "Public keys used for ssh access to Jenkins instance"
}