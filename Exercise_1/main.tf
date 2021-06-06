# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"

  count     = 4
  subnet_id = "subnet-5abc8f54"

  tags = {
    Name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "udacity_m4" {
#   ami           = "ami-0323c3dd2da7fb37d"
#   instance_type = "m4.large"

#   count     = 2
#   subnet_id = "subnet-5abc8f54"

#   tags = {
#     Name = "Udacity M4"
#   }
# }
