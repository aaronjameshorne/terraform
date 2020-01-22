
variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMIS" {
  default =  "ami-03caa3f860895f82e"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
