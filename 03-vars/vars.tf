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
  value = "testing variable in double quotes ${var.sample01}"
}
