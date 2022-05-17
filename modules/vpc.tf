module "vpc" {
  source = "terraform/terraform-aws-vpc-develop"

  name = "dev-vpc"
  region = "us-east-1"
  cidr_block = "172.20.0.0/16"
  private_subnet_cidr_blocks = ["172.20.10.0/24"]
  public_subnet_cidr_blocks = ["172.20.20.0/24"]
  availability_zones = ["ap-south-1a","ap-south-1b"]
  project = "Devops"
  environment = "development"
}
