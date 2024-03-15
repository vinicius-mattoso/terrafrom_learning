data "aws_s3_bucket" "all_buckets" {
  bucket = ""  # Empty bucket argument to list all buckets
}

output "bucket_names" {
  value = data.aws_s3_bucket.all_buckets.*.id
}