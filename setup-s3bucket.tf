resource "aws_s3_bucket" "test_s3_bucket" {
  bucket = "shamim-tf-test-bucket-1"

  tags = {
    Name        = "shamim-tf-test-bucket-1"
    Environment = "Dev"
  }
}
