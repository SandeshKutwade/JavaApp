output "DockerIP" {
  value = aws_instance.Docker_Instance[0].public_ip

}