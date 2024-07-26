resource "aws_instance" "Docker_Instance" {
  ami           = var.awsIAM
  instance_type = var.type
  key_name      = var.keyname
  tags          = var.tags
  count         = var.countinstance

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.Docker_Instance[0].public_ip
    private_key = file("/Users/sandeshkutwade/JavaApp/MumbaiKey.pem")
  }
  provisioner "file" {
    source      = "/Users/sandeshkutwade/JavaApp/TerraformCode/dockerinstall.sh"
    destination = "/home/ubuntu/dockerinstall.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 dockerinstall.sh",
      "./dockerinstall.sh"
    ]

  }
}