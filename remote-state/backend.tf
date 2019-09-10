terraform {
  backend "s3" {
    bucket     = "tj-s3-backend-course"
    key        = "terraform/tfstate.tfstate"
    access_key = "AKIA53SMBKOTDGXUFUV5"
    secret_key = "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"
    region     = "eu-west-2"
  }
}
