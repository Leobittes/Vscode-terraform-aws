resource "aws_s3_bucket" "site" {
  bucket = "bucket-lab09"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.site.bucket
  key    = "index.html"
  source = "index.html"
}

resource "aws_s3_bucket_website_configuration" "Website" {
  bucket = aws_s3_bucket.site.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "site" {
  depends_on = [
    aws_s3_bucket_ownership_controls.site,
    aws_s3_bucket_public_access_block.site,
  ]

  bucket = aws_s3_bucket.site.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access" {
  bucket = aws_s3_bucket.site.bucket
  policy = file("policy.json")
}