resource "aws_instance" "main" {
  instance_type = "t2.micro"
  ami = ""

  tags = {
    name = "sample"
  }
}

data "aws_ami" "main"{
  owners = ["973714476881"]
  name_regex = "Centos-8-DevOps-Practice"
  most_recent = true
}

resource "aws_security_group" "main" {}
