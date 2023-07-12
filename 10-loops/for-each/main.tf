resource "aws_instance" "web" {
  for_each                  = var.instances
  ami                       = data.aws_ami.main.id
  instance_type             = "t2.micro"
  #count                     = length(var.instances)
  tags                      = {
    Name                    = "Helloworld"
  }
}

data "aws_ami" "main"{
  owners                    = ["973714476881"]
  most_recent               = true
  name_regex                = "Centos-8-DevOps-Practice"
}

variable "instances" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    catalogue = {
      name          = "catalogue"
      instance_type = "t3.nano"
    }
    cart = {
      name          = "cart"
      instance_type = "t3.small"
    }
  }
}