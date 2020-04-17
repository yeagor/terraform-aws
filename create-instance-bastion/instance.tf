// ------------------------------------------------------------------------------------------- sript for pubkeys adding
data "template_file" "script_user_data" {
  template = file("${path.module}/files/add_allowed_pub_keys.sh.tpl")
  vars = {
    user = var.user
    host = var.host
    port = var.port
    pubkeys = join(";", var.pub_keys)
  }
}

// ------------------------------------------------------------------------------------------- ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// ------------------------------------------------------------------------------------------- instance
resource "aws_instance" "bastion" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = {
    Name = "bastion-${var.project}-${var.env}"
  }

  associate_public_ip_address = true
  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  key_name = var.key_name
  user_data = data.template_file.script_user_data.rendered
}