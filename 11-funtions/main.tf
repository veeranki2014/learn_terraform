variable "class" {
  default = "DevOps Engineer/SRE"
}

##Print above value
output "class" {
  value = upper(var.class)
}

variable "fruits" {
  default = ["apple", "banana", "orange"]
}

output "fruits_length" {
  value = length(var.fruits)
}

output "fruits_element" {
  value = element ( var.fruits, length(var.fruits)-2 )
}

variable "classes" {
  default = {
    devops = {
      name = "devops"
      topics = ["jenkins", "docker"]
    }
    aws = {
      name = "aws"
    }
  }
}

output "devops_topics" {
  value = var.classes["devops"]["topics"]
}

output "aws_topics" {
  value = lookup(var.classes,"aws", null )
}