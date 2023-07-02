resource "aws_instance" "web" {
  ami                       = data.aws_ami.main.id
  instance_type             = "t2.micro"
  vpc_security_group_ids    = ["sg-00cd0cb49be555ef2"]

  tags                      = {
    Name                    = "HelloWorld"
  }

  provisioner "remote-exec" {

    connection {
      type                  = "ssh"
      user                  = "centos"
      password              = "DevOps321"
      host                  = self.public_ip
    }

    inline                  = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/veeranki2014/roboshop_ansible main.yml -e env=dev -e role_name=frontend"
    ]

  }
}


data "aws_ami" "main"{
  owners                  = ["973714476881"]
  most_recent             = true
  name_regex              = "Centos-8-DevOps-Practice"
}