# AWS common variables
variable "aws_region" {
  default     = "us-west-2"
  description = "aws region code, please refer https://docs.aws.amazon.com/general/latest/gr/rande.html"
}

variable "tenancy" {
  default     = "default"
  description = "Name of the tenancy"
}

variable "ami_id" {
  default = "ami-005bdb005fb00e791" # AMI Id's always vary from region to region, this is valid for us-west-2 only
}

# Project variables
variable "namespace" {
  default     = "cd-dev"
  description = "Naming prefix for created resources, keeps them separate from other builds in the same tenancy"
}

# Networking variables
variable "vpc_cidr" {
  default = "192.168.0.0/18"
}

variable "subnet_cidr" {
  default = "192.168.1.0/24"
}

# Compute variables
variable "ec2_count" {
  default = "1"
}

variable "instance_type" {
  default = "t2.micro"
}
