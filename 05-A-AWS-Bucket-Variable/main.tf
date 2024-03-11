
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
    region = "${var.aws_region}"
    access_key = "${var.user_access_key}"
    secret_key = "${var.user_secret_key}"
}

resource "aws_s3_bucket" "bucket-from-terraform" {
  bucket = "meu-bucket-nome-terraform-new-test"

}