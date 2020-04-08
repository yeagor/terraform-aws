// ------------------------------------------------------------------------------------------- ssh pub keys script
locals {
  // Will not use AWS keypair to enable ssh access
  // because this way gives only one key be set
  // Let's add ssh pub keys into `ubuntu` user authorized keys
  // and pass the script below via instance initialization user_data
  pub_keys_script = <<-EOF
    #!/bin/bash
    # Add ssh pub keys to access the instance
    FILE=/home/ubuntu/.ssh/authorized_keys
    ${join("\n", formatlist("echo \"%s\" >> $FILE", var.pub_keys))}
    chown ubuntu: $FILE
    chmod 0600 $FILE
  EOF
}

// ------------------------------------------------------------------------------------------- instance
resource "aws_instance" "jenkins" {
  ami           = var.ami_jenkins
  instance_type = var.instance_type
  tags = {
    Name = "jenkins-${var.env}"
  }

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_jenkins.id
  ]

  user_data = local.pub_keys_script
}

// ------------------------------------------------------------------------------------------- aws_ami_launch_permission
resource "aws_ami_launch_permission" "example" {
  image_id   = var.ami_jenkins
  account_id = var.accout_to_share_ami
}