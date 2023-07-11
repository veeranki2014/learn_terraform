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
  value = element(var.fruits,1 )
}