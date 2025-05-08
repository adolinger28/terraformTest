# main.tf

# Define the required provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"  # optional, use your AWS CLI profile
}

# Create a VPC (optional - useful for networking)
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

# Create a simple EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-east-1 (update as needed)
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
