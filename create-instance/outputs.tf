output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "instance" {
  value = [
    "public dns: ${aws_instance.jenkins.public_dns}",
    "public ip: ${aws_instance.jenkins.public_ip}",
    "private dns: ${aws_instance.jenkins.private_dns}",
    "private ip: ${aws_instance.jenkins.private_ip}",
    "security_groups: ${join(",", aws_instance.jenkins.security_groups)}",
    "vpc_security_groups_ids: ${join(",", aws_instance.jenkins.vpc_security_group_ids)}"
  ]
}
