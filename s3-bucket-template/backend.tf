terraform{
    backend "s3" {
        bucket = "automatingaws20200213"
        key = "state/remote-bucket/terraform.tfstate"
        region = "us-west-2"
    }
}
