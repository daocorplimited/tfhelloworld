resource "aws_s3_bucket" "b" {
  bucket = "test-bucket"

  tags = {
    Name        = "Test bucket"
    Environment = "Dev"
  }
}