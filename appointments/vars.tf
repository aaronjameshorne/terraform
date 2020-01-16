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
  default = ""
}

variable "instance_password" {
  default = ""
}
