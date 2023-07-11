variable "class" {
  default = "DevOps Engineer/SRE"
}

##Print above value
output "class" {
  value = upper(var.class)
}