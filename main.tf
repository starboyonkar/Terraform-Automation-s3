provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "multi_bucket" {
  count  = length(var.bucket_names)
  bucket = var.bucket_names[count.index]

  tags = {
    Name        = var.bucket_names[count.index]
    Environment = "Dev"
  }
}