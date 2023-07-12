resource "aws_instance" "web" {
  ami                       = data.aws_ami.main.id
  instance_type             = "t2.micro"
  count                     = length(var.instances)
  tags                      = {
    Name                    = "var.instances-${count.index}"
  }
}

data "aws_ami" "main"{
  owners                    = ["973714476881"]
  most_recent               = true
  name_regex                = "Centos-8-DevOps-Practice"
}

variable "instances" {
  default = ["frontend", "mongodb", "catalogue"]
}