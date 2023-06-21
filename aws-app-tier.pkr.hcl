packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "my-ami" {
  
access_key = var.access_key
secret_key = var.secret_key
ami_name = "packer-app-ami"
source_ami = "ami-022e1a32d3f742bd8"
instance_type = "t2.micro"
region = "us-east-1"
ssh_username = "ec2-user" 

}

build{
 sources = [
  "amazon-ebs.my-ami"
  ]
 provisioner "file" {
  source = "data.zip"
  destination = "/home/ec2-user/data.zip"
}

provisioner "shell"{
  script = "script.sh"
}
}