output "endpoint" {
  value = module.api.endpoint
}
output "internal_endpoint" {
  value = module.api.internal_endpoint
}
output "lambda_arn" {
  value = module.lambda.arn
}
output "lambda_invoke_arn" {
  value = module.lambda.invoke_arn
}
output "lambda_name" {
  value = module.lambda.name
}
output "lambda_role_name" {
  value = module.lambda.role_name
}
output "data_bucket_name" {
  value = local.has_data_bucket ? aws_s3_bucket.data[0].bucket : null
}
output "data_bucket_arn" {
  value = local.has_data_bucket ? aws_s3_bucket.data[0].arn : null
}