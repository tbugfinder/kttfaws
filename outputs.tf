output "bucket_module" {
  description = "Outputs of the bucket resource."
  value       = aws_s3_bucket.this.*
}
