provider "aws" {
  region     = "us-west-2"
}

module "dev_vpc" {
  source      = "../modules/1-vpc"
  vpc_cidr    = "192.168.0.0/18"
  tenancy     = "default"
  vpc_id      = "${module.dev_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "dev_ec2" {
  source        = "../modules/ec2"
  ec2_count     = "1"
  instance_type = "t2.micro"
  subnet_id     = "${module.dev_vpc.subnet_id}"
  ami_id        = "ami-005bdb005fb00e791"
}
