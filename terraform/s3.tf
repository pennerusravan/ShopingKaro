resource "aws_s3_bucket" "env_file" {
  bucket = local.resource_prefix
  tags = merge(local.common_tags, { Name = local.resource_prefix })
}

resource "aws_s3_object" "env_file" {
  bucket = aws_s3_bucket.env_file.id
  key    = "env_file.env"
}