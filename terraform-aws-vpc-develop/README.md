# terraform-aws-vpc

A Terraform module to create an Amazon Web Services (AWS) Virtual Private Cloud (VPC).

## Usage

This module creates a VPC alongside a variety of related resources, including:

- Public and private subnets
- Public and private route tables
- Elastic IPs
- Network Interfaces
- NAT Gateways
- An Internet Gateway
- A VPC Endpoint
- A bastion EC2 instance

Example usage:

```code
  
  module "vpc" {
  source = "github.com/ajaytrivedi67/terraform-aws-vpc-develop"
  name = "dev-vpc"
  region = "us-east-1"
  cidr_block = "172.20.0.0/16"
  private_subnet_cidr_blocks = ["172.20.10.0/24"]
  public_subnet_cidr_blocks = ["172.20.20.0/24"]
  availability_zones = ["ap-south-1a","ap-south-1b"]
  project = "Devops"
  environment = "development"
}


### Configuring security rules




## Variables

- `name` - Name of the VPC (default: `Default`)
- `project` - Name of project this VPC is meant to house (default: `Unknown`)
- `environment` - Name of environment this VPC is targeting (default: `Unknown`)
- `region` - Region of the VPC (default: `us-east-1`)
- `cidr_block` - CIDR block for the VPC (default: `10.0.0.0/16`)
- `public_subnet_cidr_blocks` - List of public subnet CIDR blocks (default: `["10.0.0.0/24","10.0.2.0/24"]`)
- `private_subnet_cidr_blocks` - List of private subnet CIDR blocks (default: `["10.0.1.0/24", "10.0.3.0/24"]`)
- `availability_zones` - List of availability zones (default: `["us-east-1a", "us-east-1b"]`)
- `tags` - Extra tags to attach to the VPC resources (default: `{}`)
