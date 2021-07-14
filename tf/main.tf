terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.region
  access_key = "$ACCESSKEY"
  secret_key = "$SECRETKEY"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  cidr    = "10.0.0.0/21"
  name    = "Demo2"
  azs     = data.aws_availability_zones.available.names
  ##  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets      = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
  public_subnets       = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  public_subnet_tags = {
    Name = "${var.env_prefix}-public-sny"
  }
  private_subnet_tags = {
    Name = "${var.env_prefix}-private-sn"
  }
  tags = var.tags
}

data "aws_availability_zones" "available" {
  state = "available"
}
