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

# resource "aws_s3_bucket" "state_bucket" {
#   bucket = var.s3bpucketnamet
#   tags = {
#     Name = var.s3bpucketnamet
#     Env = "Development"
#   }
  
# }

# resource "aws_dynamodb_table" "state_table" {
#   name = "Terrafrom_State"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key = "LockID"
#   attribute {
#       name = "LockID"
#       type = "S"
#     }
#   depends_on = [ aws_s3_bucket.state_bucket ]
# }

# terraform {
#   backend "s3" {
#     bucket = "terraform-bucket-itsme"
#     key = "Terraform/state/file"
#     encrypt = false
#     dynamodb_table = "Terrafrom_State"
#     region = "ap-south-1"
#   }
# }


