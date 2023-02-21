resource "aws_s3_bucket" "remote-state" {
  bucket = format("tfstate-%s-%s-5080", var.project, var.environment)
  versioning {
    enabled = true
  }
  tags = var.tags
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }
  }

  required_version = ">= 0.14.9"

  backend "s3" {
    bucket = "tfstate-microservices-qa-5080"
    key    = "qa/terraform.tfstate"
    region = "us-east-1"
  }
}