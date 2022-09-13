resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "terraform-state-bucket-samuelbartels"

  tags = {
    Name        = "terraform-state-bucket"
  }

    versioning {
    enabled = true
  }

   lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}

resource "aws_s3_bucket_acl" "terraform-state-bucket-acl" {
  bucket = aws_s3_bucket.terraform-state-bucket.id
  acl    = "private"
}