//output "script" {
//  value = data.template_file.script.rendered
//}
//

output "instance" {
  value = [
    "public dns: ${aws_instance.bastion.public_dns}",
    "public ip: ${aws_instance.bastion.public_ip}"
  ]
}
