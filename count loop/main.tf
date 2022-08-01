provider "aws"{
  region ="ap-south-1"
}
resource "aws_instance" "web" {
    count= length(var.vkvishnu)
    ami  = var.ami[count.index]
    instance_type = "t2.micro"
    tags = {
      Name = var.vkvishnu[count.index],
      Owner= "vishnu"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

