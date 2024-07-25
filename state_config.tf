terraform {
  backend "s3" {
    bucket = "bia-tf"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "bia"
  }
}