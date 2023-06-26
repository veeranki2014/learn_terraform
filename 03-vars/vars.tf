variable "sample" {
  default = "Hello World"
}
variable "sample01" {
  default = 1000
}

output "sample" {
  value = var.sample
}

output "sample01" {
  value = var.sample01
}

## if sometime if any variable/reference combination of someother stings, we can access using ${} flower braces.
output "sample_ext" {
  value = "testing variable in double quotes ${var.sample01 }"
}

##Data Types in Terraform variables
# Strings
# Numbers
# Boolean

## Variable types in Ansible 1) plain key=value 2) List 3) Map/Dictionary
## Variable Types in Terraform
# 1. Plain
# 2. List
# 3. Map

#plain:
variable "course" {
  default = "DevOps"
}

## List
variable "courses" {
  default = [
    "DevOps",
    "AWS",
    "AZURE"
  ]
}

## Map
variable "course_details" {
  default = {
    DevOps = {
      course = "DevOps",
      Timings = "9PM",
      duration = 90
    }
    AWS = {
      course = "aws",
      duration = 30
    }
  }
}

