variable "namespace" {
  default = "cd"
  description = "Naming prefix for created resources, keeps them separate from other builds in the same tenancy"
}

variable "vpc_name" {
  default = "default-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/18"
}

variable "tenancy" {
  default = "dedicated"
  description = "Name of the tenancy"
}

variable "vpc_id" {
  default = ""
}

variable "subnet_name" {
  default = "subnet"
}

variable "subnet_cidr" {
  description = "CIDR of the desired subnet for the VPC, e.g. 10.0.0.0/8 or 192.168.0.0/16"
  default = "10.0.1.0/18"
}
