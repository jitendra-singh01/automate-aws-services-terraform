provider "aws" {
  access_key = "AKIAIGNAJHZ36N5VTPJA"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_iam_role" "role" {
  name = "ec2-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  
}
resource "aws_iam_instance_profile" "ec2-role" {
  name = "ec2-role"
  role = "${aws_iam_role.role.name}"
}


