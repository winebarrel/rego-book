terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region                      = "ap-northeast-1"
  access_key                  = "dummy"
  secret_key                  = "dummy"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

variable "tags" {
  type = map(string)
  default = {
    Owner = "platform"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "example-logs"
  tags   = var.tags
}

resource "aws_s3_bucket" "tmp" {
  bucket = "example-tmp"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-12345678"
}
