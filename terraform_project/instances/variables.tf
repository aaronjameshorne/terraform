variable "region" {
  default     = "eu-west-1"
  description = "AWS Region"
}

variable "ec2_instance_type" {
  description = "EC2 Instance type to launch"
}

variable "key_pair_name" {
  default     = "myEC2Keypair"
  description = "Keypair to use to connect to EC2 Instances"
}

variable "max_instance_size" {
  description = "Maximum number of instances to launch"
}

variable "min_instance_size" {
  description = "Minimum number of instances to launch"
}
