variable "region" {
  default = "us-west-1"
  description = "AWS Region"
}

variable "ec2_instance_type" {
  description = "EC2 Instance type to launch"
}

variable "key_pair_name" {
  default = "webapp"
  description = "Key to use for ec2 instance"
  
}

variable "max_instance_size" {
  description = "Max number of instances to launch"
}

variable "min_instance_size" {
  description = "Min number of instances to launch"
}

