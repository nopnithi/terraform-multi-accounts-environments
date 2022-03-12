terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5.0"
    }
  }
}

provider "aws" {
  alias                    = "provider1"
  region                   = "ap-southeast-1"
  profile                  = "main"
  shared_credentials_files = ["~/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/terraform-role"
  }
}

provider "aws" {
  alias                    = "provider2"
  region                   = "ap-northeast-1"
  profile                  = "main"
  shared_credentials_files = ["~/.aws/credentials"]

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/terraform-role"
  }
}