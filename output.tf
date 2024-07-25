output "getIp" {
  value = aws_instance.Jenkins_All[*].public_ip

}