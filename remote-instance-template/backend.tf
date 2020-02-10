terraform {
  backend "s3" {
    bucket         = "bucket-name"
    dynamodb_table = "terraform"
    encrypt        = true
    profile        = "cloudengineering"
    key            = "state/remote-ec2/terraform.tfstate"
    region         = "us-west-1"
  }
}
