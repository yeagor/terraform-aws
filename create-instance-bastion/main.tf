// ------------------------------------------------------------------------------------------- provider
provider "aws" {
  profile = var.profile
  region = var.region

}

// ------------------------------------------------------------------------------------------- security group
resource "aws_security_group" "allow_ssh" {
  name = "allow ssh ${var.project} ${var.env} bastion"
  description = "Allow SSH access to ${var.project} ${var.env} bastion instance"

  tags = {
    Name = "allow-ssh-${var.project}-${var.env}-bation"
  }

  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
    ipv6_cidr_blocks = [
      "::/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
    ipv6_cidr_blocks = [
      "::/0"]
  }
}
