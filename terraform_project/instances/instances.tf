provider "aws" {
    region = "${var.region}"
  
}


data "terraform_remote_state" "network_configuration" {
    backend = "s3"
    config {
        bucket = "${var.remote_state_bucket}"
        key = "${var.remote_state_key}"
        region = "${var.region}"
    }
}

resource "aws_security_group" "ec2_public_security_group" {
  name = "EC2-Public-SG"
  description = "Internet reaching access for EC2 instances "
  vpc_id = "${data.terraform_remote_state.network_configuration.vpc_id}"


ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["45.73.149.202/32"]
}

egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
 }

}

resource "aws_security_group" "ec2_private_security_group" {
  name = "EC2-Private-SG"
  description = "Only allow public security group resouces to access these instances"
  vpc_id = "${data.terraform_remote_state.network_configuration.vpc_id}"

  ingress {
      from_port = 0
      protocol = "-1"
      to_port = 0
      cidr_blocks = ["${aws_security_group.ec2_public_security_group.id}"]
  }

    ingress {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
}
