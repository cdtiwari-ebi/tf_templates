provider "aws" {
  region = "${var.aws_region}"
}

module "dev_vpc" {
  source      = "../modules/vpc"
  vpc_id      = "${module.dev_vpc.vpc_id}" # This is output variable from module
  namespace   = "${var.namespace}"
  vpc_cidr    = "${var.vpc_cidr}"
  tenancy     = "${var.tenancy}"
  subnet_cidr = "${var.subnet_cidr}"
}

module "dev_ec2" {
  source        = "../modules/ec2"
  subnet_id     = "${module.dev_vpc.subnet_id}" # This is output variable from module
  namespace     = "${var.namespace}"
  ec2_count     = "${var.ec2_count}"
  instance_type = "${var.instance_type}"
  ami_id        = "${var.ami_id}"
}
