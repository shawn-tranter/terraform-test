
resource "aws_security_group" "server_sg" {
  name        = "server sg"
  description = "Allow SSH/http inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.management_server_ips
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my security group"
  }
}

resource "aws_instance" "server" {
  ami           = "ami-088ff0e3bde7b3fdf"
  instance_type = "t2.nano"
  key_name = var.management_key_name
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  security_groups = [ aws_security_group.server_sg.id ]
  user_data = <<-EOF
              #!/bin/bash
              sudo su
              yum -y update
              yum -y install httpd
              echo "Hello, World" | tee /var/www/html/index.html
              systemctl start httpd
              EOF

  tags = {
    Name = "terraform-example"
  }
}
