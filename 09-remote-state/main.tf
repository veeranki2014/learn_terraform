terraform {
  backend "s3" {
    bucket  = "terraform"
    key     = "sample/terraform.tfstate"
    region  = "us-east-1"
  }
}