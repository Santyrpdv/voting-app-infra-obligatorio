variable "perfil" {
}
variable "region" {
  type = string
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}
variable "dynamodb_table" {
  type = string
}
variable "bucket_s3" {
  type = string
}







variable "vpc_cidr" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "public_subnet-2" {
  type = string
}

variable "vpc_aws_az" {
  default = "us-east-1a"
}

variable "vpc_aws_az-2" {
  default = "us-east-1b"
}

/*
  output "ec2-id" {
    value = aws_instance.ac1-instance.id
  }

  output "ec2-dns" {
    value = aws_instance.ac1-instance.public_dns
  }

  output "ec2-public-ip" {
    value = aws_instance.ac1-instance.public_ip
  }

  output "lb-ip" {
    value = aws_lb.ac1-lb.dns_name
  }*/