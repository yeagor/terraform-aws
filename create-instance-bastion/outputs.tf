output "script_user_data" {
  value = {
    rendered: data.template_file.script_user_data.rendered
  }
}

output "instance" {
  value = [
    "public dns: ${aws_instance.bastion.public_dns}",
    "public ip: ${aws_instance.bastion.public_ip}"
  ]
}
