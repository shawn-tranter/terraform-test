variable "management" {
  type = object({
    server_ips = list(string)
    key_name = string
  })
}
