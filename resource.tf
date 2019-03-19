resource "google_compute_network" "our_development_network" {
  name                    = "devnetwork"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet" {
  ip_cidr_range = "10.0.1.0/24"
  name          = "${google_compute_network.our_development_network.name}"
  network       = "${google_compute_network.our_development_network.self_link}"
  region        = "us-west1"
}

resource "aws_vpc" "env_example_two" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    name = "tf-aws-vpc-example-two"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.env_example_two.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.env_example_two.id}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = "${cidrsubnet(aws_vpc.env_example_two.cidr_block, 2, 2)}"
  vpc_id            = "${aws_vpc.env_example_two.id}"
  availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.env_example_two.id}"

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["${aws_vpc.env_example_two.cidr_block}"]
  }
}
