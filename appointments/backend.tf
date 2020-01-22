terraform {
  backend "s3" {
    bucket = "terraform-remote-state-2020-03-01"
    key    = "terraform/appointment/terraform.tfstate"
    region = "us-west-1"
  }
}
