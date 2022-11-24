resource "aws_s3_bucket" "fpuiashd_default_bucket_s3" {
  bucket = "fpuiashd-default-s3-bucket"

  tags = {
    Name        = "fpuiashd Default S3 Bucket"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_acl" "fpuiashd_default_bucket_s3_acl" {
  bucket = aws_s3_bucket.fpuiashd_default_bucket_s3.id
  acl    = "public-read"
}
