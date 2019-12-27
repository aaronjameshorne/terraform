variable "region" {
  default = "us-west-1"
  description = "new aws vpc adn ec2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "VPC cidr_block"
}
