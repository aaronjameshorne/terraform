variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMIS" {
  type = "map"
  default = {
      us-west-1 = "ami-03caa3f860895f82e"
  }
}

variable "instance_username" {
  default = "ec2-user"
}

variable "path_to_private_key" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
