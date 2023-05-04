terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.65.0"
    }
  }
}

provider "aws" {
  region     = "us-west-1"
    # access_key = "AKIAXBOFAAXYVWHQSPWJ"
    # secret_key = "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"
    access_key = "AKIAXBOFAAXYTMOFNE66"
    secret_key = "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"
  }
    