resource "aws_instance" "main" {
  instance_type = "t2.micro"
  ami = data.aws_ami.main.id
  vpc_security_group_ids = [ aws_security_group.main.id]

  tags = {
    Name = "sample"
  }

}

data "aws_ami" "main"{
  owners = ["973714476881"]
  name_regex = "Centos-8-DevOps-Practice"
  most_recent = true
}

resource "aws_security_group" "main" {
  name        = "sample"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sample"
  }
}