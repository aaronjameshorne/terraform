output "vpc_id" {
    value = "${aws_vpc.production-vpc.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.production-vpc.cidr_block}"
}
