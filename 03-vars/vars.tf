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
