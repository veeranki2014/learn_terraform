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

output "fruits_names" {
  value = length(var.fruits)
}