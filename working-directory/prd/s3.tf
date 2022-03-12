resource "aws_s3_bucket" "bucket" {
  bucket = "nopnithi-s3-prd"

  tags = {
    Name        = "nopnithi-s3-prd"
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  count = var.enable_versioning ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}