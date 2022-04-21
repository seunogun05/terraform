terraform {
  backend "s3" {
    bucket = "seunterra"
    key    = "traformstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "TerraSunday" {
  ami = var.my_image
  instance_type = var.my_type
  key_name = "03_18 keyz"
  security_groups = [aws_security_group.terra_sg.name]
  tags = {
    Name = var.my_tag
  }
}

resource "aws_security_group" "terra_sg" {
  name        = "allow_ports"
  description = "Allow ALL ports"

  ingress {
    description      = "Custom sg"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    description      = "Custom sg2"
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = var.my_tag
  }
}

 module "my_database" {
  source = "./modules/database"
name = "kenkool"
 }

module "my_vpc" {
  source = "./modules/vpc"
  cidr_block = "10.5.0.0/16"
}
