data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-east-1a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

output "price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

data "aws_security_group" "main"{
  name = "allow-all"
}

output "sg_name"{
  value = data.aws_security_group.main.id
}