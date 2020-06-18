output "vpc_id" {
  value       = aws_vpc.my_vpc.id
  description = "The domain name of the load balancer"
}

output "subnet_1a_id" {
  value       = aws_subnet.my_subnet_1a.id
  description = "The domain name of the load balancer"
}

output "subnet_1b_id" {
  value       = aws_subnet.my_subnet_1b.id
  description = "The domain name of the load balancer"
}