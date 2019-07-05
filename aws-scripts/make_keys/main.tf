provider "aws" {

    access_key = "AKIAIGNAJHZ36N5VTPJA"
  secret_key = "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"
    region = "${var.aws_region}"
}
resource "aws_key_pair" "instance_root_key_pa" {
    key_name = "instance_root_key_pa"
    public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "developervm" {
    ami = "ami-14c5486b"  #amazon linux for us-east-1
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.deve_security_group.id}"]
    key_name = "${aws_key_pair.instance_root_key_pa.id}"
    tags {
    Name = "vm_for_developer"
    }
}

resource "aws_security_group" "deve_security_group" {
    name = "deve_security_group"
    description = "Allow HTTP and SSH connections."

    ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.developervm.public_ip}"
}


