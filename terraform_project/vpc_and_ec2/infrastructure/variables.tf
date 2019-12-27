variable "region" {
  default = "us-west-1"
  description = "new aws vpc adn ec2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "VPC cidr_block"
}

variable "public_vpc_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
}

variable "public_vpc_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
}

variable "public_vpc_subnet_3_cidr" {
  description = "Public Subnet 3 CIDR"
}

variable "private_subnet_1_cidr" {
  description = "private subnet 1 cidr"
}

variable "private_subnet_2_cidr" {
  description = "private subnet 2 cidr"
  
}

variable "private_subnet_3_cidr" {
   description = "private subnet 3 cidr"
}
