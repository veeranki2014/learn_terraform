terraform {
  backend "s3" {
    bucket  = "terraform-b4891"
    key     = "sample/terraform.tfstate"
    region  = "us-east-1"
  }
}

output "demo" {
  value = "Hello Terraform World"
}