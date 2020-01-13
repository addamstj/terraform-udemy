terraform {
  backend "s3" {
    bucket     = "tj-s3-backend-course"
    key        = "terraform/tfstate.tfstate"
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    region     = "eu-west-2"
  }
}
