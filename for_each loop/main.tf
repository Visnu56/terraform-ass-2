provider "aws"{
  region ="ap-south-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24.0"
    }
  }
}
resource "aws_instance" "web" {   # for_each loop used for map
    for_each = var.MAP
    ami  = each.value.ami
    instance_type = each.value.instance_type
    tags = {
      Name = each.value.name
      Owner= "visnu"
  }
}

resource "aws_instance" "web2" {     # used for set
    for_each = toset(var.SET)
    ami  = "ami-08df646e18b182346"
    instance_type = "t2.micro"
    tags = {
      Name = each.key
      Owner= "visnu121"
  }
}

