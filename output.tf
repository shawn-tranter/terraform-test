output "server_dns" {
  value = aws_instance.server.public_dns
  description = "Server DNS"
}