provider "aws" {
   region = "${var.region}"
  }

terraform {
    backend "s3" {}
}

resource "aws_vpc" "production-vpc" {
  cidr_block           = "${var.vpc_cidr}"
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
      name          = "public-subnet-3" 
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block        = "${var.private_subnet_1_cidr}"
  vpc_id            = "${var.production-vpc.id}"
  availability_zone = "us-west-1a"

  tags {
      Name          = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = "${var.private_subnet_2_cidr}"
  vpc_id            = "${var.production-vpc.id}"
  availability_zone = "us-west-1b"

  tags {
      Name = "Private-Sunet-2"
  }
}

resource "type" "private-subnet-3" {
  cider__block      = "${var.private_subnet_3_cidr}"
  vpc_id            = "${var.production-vpc.id}"
  availability_zone = "us-west-1c"

  tgas {
      Name          = "Private-subnet-3"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id      = "${aws_vpc.production-vpc.id}"
  tags {
      Name    = "Public-Route-Table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id      = "${aws_vpc.production-vpc.id}"
  tags {
      Name    = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "public-subnet-1-association" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.public-subnet-1.id}"
}

resource "aws_route_table_association" "public-subnet-2-association" {
    route_table_id    = "${aws_route_table.public-route-table.id}"
    subnet_id         = "${aws_subnet.public-subnet-2.id}"
}

resource "aws_route_table_association" "public-subnet-3-association" {
    route_table_id = "${aws_route_table.public-route-table.id}"
    subnet_id      = "${aws_subnet.public-subnet-3.id}"
}

resource "aws_route_table_association" "private-subnet-1-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id      = "${aws_subnet.private-subnet-1.id}"
}

resource "aws_route_table_association" "private-subnet-2-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id      = "${aws_subnet.private-subnet-2.id}"
}

resource "aws_route_table_association" "private-subnet-3-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id      = "${aws_subnet.private-subnet-3.id}"
  
}

resource "aws_eip" "elastic-ip-for-nat-gw" {
    vpc = true
    associate_with_private_ip = "10.0.0.5"

    tags {
        name = "Production-EIP"
    }
  
}

resource "aws_nat_gatewat" "nat-gw" {
    allocation_id = "${aws_eip.elastic-ip-for-nat-gw.id}"
    subnet_id     = "${aws_subnet.public-subnet-1.id}"

    tags {
        name = "Production-NAT-GW"
    }

    depends_on = ["${aws_eip.elastic-ip-for-nat-gw}"]
}

resource "aws_route" "nat-gw-route" {
    route_table_id         = "${aws_route.private-route-table.id}"
    nat_gateway_id         = "${aws_nat_gateway.nat-gw.id}"
    destination_cidr_block = "0.0.0.0/0"
  
}

resource "aws_internet_gateway" "production-igw" {
    vpc_id = "${aws_vpc.production-vpc.id}"

    tags {
        name = "Production-IGW"
    }
}

resource "aws_route" "public-internet-gw-route" {
  route_table_id = "${aws_route_table.public-route_table.id}"
  gateway_id = "${aws_internet_gatewat.production-igw.id}"
  destination_cidr_block = "0.0.0.0/0"
}
