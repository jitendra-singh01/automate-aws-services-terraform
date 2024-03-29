variable "count"{
default = 1
}
variable"region"{
description = "AWS region for hosting our your network"
  default = "us-east-1"
}
variable "public_key_path" {
  description = "Enter the path to the SSH Public Key to add to AWS."
  default = "/root/.ssh/id_rsa.pub"
}
variable "key_name" {
  description = "Key name for SSHing into EC2"
  default = "tanishq"
}
variable "amis" {
  description = "Base AMI to launch the instances"
  default = {
  ap-south-1 = "ami-2757f631"
  }
}
