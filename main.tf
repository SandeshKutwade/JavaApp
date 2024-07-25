resource "aws_instance" "Jenkins_All" {
  ami           = var.amivar
  instance_type = "t2.medium"
  key_name      = var.keyname
  count         = var.numinstance
  tags          = var.tagsvalue

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.Jenkins_All[0].public_ip
    private_key = file("MumbaiKey.pem")
  }

  provisioner "file" {
    source      = "InstallAll.sh"
    destination = "/home/ubuntu/InstallAll.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 InstallAll.sh",
      "./InstallAll.sh",
      "touch file22.txt"
    ]

  }


}