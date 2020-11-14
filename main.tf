#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
#

resource "aws_s3_bucket" "this" {
  bucket = "my-tf-test-bucket-${var.id}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
