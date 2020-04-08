// ------------------------------------------------------------------------------------------- provider
provider "aws" {
  profile = var.profile
  region  = var.region
}

// ------------------------------------------------------------------------------------------- security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow ssh jenkins"
  description = "Allow SSH access to instance"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

// ------------------------------------------------------------------------------------------- security group
resource "aws_security_group" "allow_jenkins" {
  name        = "allow 8080 jenkins"
  description = "Allow access from the outter to Jenkins on 8080"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
