variable "AWS_REGION" {
  default = "us-west-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "ssh key"
}

variable "AMIS" {
    description = "image"
  
  }

variable "t2-micro-size" {
  description = "instance size"
  
}
