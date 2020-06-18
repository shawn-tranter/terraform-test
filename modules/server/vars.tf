
variable "subnet_id" {
  description = "server subnet id"
  type        = string
}

variable "vpc_id" {
  description = "server vpc id"
  type        = string
}

variable "management_server_ips" {
    type = list(string)
}

variable "management_key_name" {
    type = string
}