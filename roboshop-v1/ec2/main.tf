resource "aws_instance" "main" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.main.id
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = var.name
  }
}

resource "null_resource" "ansible" {
  depends_on = [aws_instance.main, aws_route53_record.main]
  provisioner "remote-exec" {
    connection {
      type                = "ssh"
      user                = "centos"
      password            = "DevOps321"
      host                = aws_instance.main.public_ip
    }
    inline                = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/veeranki2014/roboshop_ansible main.yml -e env=dev -e role_name=${var.name}"
    ]
  }
}

resource "aws_route53_record" "main" {
  zone_id                   = "Z05332201VBHF9VM3Q9N5"
  name                      = "${var.name}-dev"
  type                      = "A"
  ttl                       = 30
  records                   = [aws_instance.main.private_ip]
}

data "aws_ami" "main"{
  owners                    = ["973714476881"]
  name_regex                = "Centos-8-DevOps-Practice"
  most_recent               = true
}

resource "aws_security_group" "main" {
  name                      = var.name
  description               = "Allow TLS inbound traffic"

  ingress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]

  }

  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
  }

  tags                      = {
    Name                    = var.name

  }
}

variable "name" {}
