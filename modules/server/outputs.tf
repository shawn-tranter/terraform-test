output "public_dns" {
  value = aws_instance.server.public_dns
  description = "The domain name of the load balancer"
}

