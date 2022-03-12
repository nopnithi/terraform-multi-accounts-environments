resource "aws_s3_bucket" "bucket1" {
  provider = aws.provider1
  bucket   = "nopnithi-s3-${var.provider1_name}"

  tags = {
    Name        = "nopnithi-s3-${var.provider1_name}"
    Environment = var.provider1_name
  }
}
resource "aws_s3_bucket_acl" "bucket1_acl" {
  provider = aws.provider1
  bucket   = aws_s3_bucket.bucket1.id
  acl      = "private"
}

resource "aws_s3_bucket" "bucket2" {
  provider = aws.provider2
  bucket   = "nopnithi-s3-${var.provider2_name}"

  tags = {
    Name        = "nopnithi-s3-${var.provider2_name}"
    Environment = var.provider2_name
  }
}
resource "aws_s3_bucket_acl" "bucket2_acl" {
  provider = aws.provider2
  bucket   = aws_s3_bucket.bucket2.id
  acl      = "private"
}
