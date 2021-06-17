terraform {
  backend "s3" {
    bucket = "access-control-staging-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}