provider "aws" {
  profile = var.profile
  region = var.region
}

/*
  Use script to init Terraform: files/terraform_init.sh
  See for details: https://github.com/hashicorp/terraform/issues/13022#issuecomment-294262392
*/
terraform {
  backend s3 {}
}

data "terraform_remote_state" "state" {
  backend = "s3"
  config = {
    profile = var.profile
    region = var.region
    bucket = var.bucket
    key = "${var.env}/state.tfstate"
    # encrypt = true #AES-256
  }
}

# Need to imported
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
}

