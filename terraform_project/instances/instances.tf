provider "aws" {
    region = "${var.region}"
  
}

terraform {
    bacnkend "s3" {}
}

data "terraform_remote_state" "network_configuration" {
    backend = "s3"
    config {
        bucket = ""
    }
}
