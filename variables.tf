variable "amivar" {
  description = "AMI info here"

}
variable "keyname" {
  description = "keyname here"
  default     = "MumbaiKey"
}

variable "numinstance" {
  default = "number of instances here"

}

variable "tagsvalue" {
  default = {
    Name = "Nemo_Instance"
  }

}
variable "s3bpucketnamet" {
  description = "Provide bucket name for s3"
  
}

