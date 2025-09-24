 provider "aws" {
    region = var.aws_region
  }
         

resource "aws_vpc" "default_vpc" {
  cidr_block = "10.0.0.0/16"
}

# resource "aws_subnet" "main_subnet" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = true
# }

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.default_vpc.id # every security group works under vpc so we need id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open SSH to all (change this in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami_id # Amazon Linux 2 AMI (change if needed)
  instance_type = var.instance_type
  # subnet_id              = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  # OR
  # security_groups        = [aws_security_group.allow_ssh.name]

  key_name = aws_key_pair.deployer.public_key

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

