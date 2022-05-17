variable "key_name" {
  type        = string
  description = "EC2 Key pair name for the jenkins"
}
variable "vpc_id" {
  type        = string
  
}

variable "name" {
  type        = string
  
}

variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list
  description = "List of availability zones"
}

variable "jenkins_ami" {
  type        = string
  description = "Bastion Amazon Machine Image (AMI) ID"
}

variable "jenkins_ebs_optimized" {
  default     = false
  type        = bool
  description = "If true, the jenkins instance will be EBS-optimized"
}

variable "jenkins_instance_type" {
  default     = "t3.nano"
  type        = string
  description = "Instance type for jenkins instance"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}
variable "project" {

  type        = string
  description = "Extra tags to attach to the VPC resources"
}
variable "environment" {

  type        = string
  description = "Extra tags to attach to the VPC resources"
}

variable "sg_pub_id" {

  type        = string
  description = "Extra tags to attach to the VPC resources"
}

variable "sg_priv_id" {

  type        = string
  description = "Extra tags to attach to the VPC resources"
}


variable "privat_ins_name" {

  type        = string
  description = "Extra tags to attach to the VPC resources"
}