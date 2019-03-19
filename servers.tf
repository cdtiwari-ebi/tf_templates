resource "google_compute_instance" "firstserver" {
  name = "thefirstserver"

  "boot_disk" {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  machine_type = "n1-standard-1" //n1-standard-1
  zone         = "us-west1-a"

  "network_interface" {
    subnetwork    = "${google_compute_subnetwork.dev-subnet.name}"
    access_config = {}
  }

  metadata {
    foo = "bar"
  }

  //Permission operation within Google cloud platform
  //  service_account {
  //    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  //  }
}

// Terraform plugin for creating random ids
//resource "random_id" "instance_id" {
// byte_length = 8
//}

// A single Google Cloud Engine instance
//resource "google_compute_instance" "default" {
// name         = "flask-vm-${random_id.instance_id.hex}"
// machine_type = "f1-micro"
// zone         = "us-west1-a"
//
// boot_disk {
//   initialize_params {
//     image = "debian-cloud/debian-9"
//   }
// }
//
//// Make sure flask is installed on all new instances for later steps
// metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
//
// network_interface {
////   network = "default"
//   subnetwork = "${google_compute_subnetwork.dev-subnet.name}"
//
//   access_config {
//     // Include this section to give the VM an external ip address
//   }
// }
//}

// AWS

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "secondserver" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "identifiertag"
  }

  subnet_id = "${aws_subnet.subnet2.id}"
}
