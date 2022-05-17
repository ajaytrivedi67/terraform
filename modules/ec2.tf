module "ec2" {
  source = "terraform/terraform-aws-ec2-develop"
  cidr_block = "172.20.0.0/16"
  vpc_id = "vpc-0c48111479bc06649"
  private_subnet_cidr_blocks = ["172.20.10.0/24"]
  public_subnet_cidr_blocks = ["172.20.20.0/24"]
  sg_pub_id  = "subnet-02b8bd879c4b35266"
  sg_priv_id = "subnet-0f9421c251747bec8"
  availability_zones = ["ap-south-1a","ap-south-1b"]
  jenkins_ami = "ami-079b5e5b3971bd10d"
  jenkins_ebs_optimized = true
  jenkins_instance_type = "t2.medium"
  key_name = "jenkins"
  name = "jenkins"
  privat_ins_name = "tomcat"
  project = "devops"
  environment = "dev" 

}
