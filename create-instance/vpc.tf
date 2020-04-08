// ------------------------------------------------------------------------------------------- vpc
# Need to imported
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
}
