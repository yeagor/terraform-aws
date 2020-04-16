variable profile {
  description = "AWS Profile"
}
variable region {
  description = "AWS Region"
}
variable project {
  description = "Project name"
}
variable env {
  description = "Environment name"
}
variable vpc_id {
  description = "Virtual Private Cloud Id"
}
variable subnet_id {
  description = "Subnet id for instance creation"
}
variable instance_type {
  description = "Bastion instance type"
  default     = "t2.micro"
}
variable user {
  description = "User to add on bastion instance for ssh port forwarding"
}
variable pub_keys {
  description = "Public keys added to user authorized keys on Bation"
}
variable host {
  description = "Host to forward port from"
}
variable port {
  description = "Port to forward"
}
variable key_name {
  description = "Key pair name to add"
}