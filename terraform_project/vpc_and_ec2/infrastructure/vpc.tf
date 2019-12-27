provider "aws" {
   region = "${var.region}"
  }

terraform {
    backend "s3" {}
}

resource "aws_vpc" "production-vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
      Name = "production-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block        = "${var.public_vpc_subnet_1_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-west-1"

  tags {
      name = "public-subnet-1" 
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block        = "${var.public_vpc_subnet_2_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-west-1b"

  tags {
      name = "public-subnet-2" 
  }
}

resource "aws_subnet" "public-subnet-3" {
  cidr_block        = "${var.public_vpc_subnet_3_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-west-1c"

  tags {
      name = "public-subnet-3" 
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block      = "${var.private_subnet_1_cidr}"
  vpc_id          = "${var.production-vpc.id}"
  availability_zone = "us-west-1a"

  tags {
      Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block = "${var.private_subnet_2_cidr}"
  vpc_id = "${var.production-vpc.id}"
  availability_zone = "us-west-1b"

  tags {
      Name = "Private-Sunet-2"
  }
}

resource "type" "name" {
  cider__block = "${var.private_subnet_3_cidr}"
  vpc_id = "${var.production-vpc.id}"
  availability_zone = "us-west-1c"

  tgas {
      Name = "Private-subnet-3"
  }
}
