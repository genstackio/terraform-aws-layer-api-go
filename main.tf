module "api" {
  source               = "genstackio/api-lambda/aws"
  version              = "0.1.13"
  name                 = var.name
  env                  = var.env
  lambda_arn           = module.lambda.arn
  dns                  = var.dns
  dns_zone             = var.dns_zone
  forward_query_string = var.forward_query_string
  price_class          = var.price_class
  geolocations         = var.geolocations
  accesslogs_s3_bucket = var.accesslogs_s3_bucket
  providers = {
    aws     = aws
    aws.acm = aws.acm
  }
}

module "lambda" {
  source            = "genstackio/lambda/aws"
  version           = "0.1.12"
  file              = var.package_file
  s3_bucket         = var.package_s3_bucket
  s3_key            = var.package_s3_key
  name              = local.lambda_name
  runtime           = var.runtime
  handler           = var.handler
  timeout           = var.timeout
  memory_size       = var.memory_size
  publish           = var.publish
  variables         = merge(
    local.has_data_bucket ? {
      DATA_BUCKET_NAME = aws_s3_bucket.data[0].bucket,
      DATA_BUCKET_ARN = aws_s3_bucket.data[0].arn,
    } : {},
    var.variables
  )
  policy_statements = concat(
    var.policy_statements,
    local.has_data_bucket
      ? [
      {
        actions   = ["s3:ListBucket"]
        resources = [aws_s3_bucket.data[0].arn]
        effect    = "Allow"
      },
      {
        actions   = ["s3:GetObject", "s3:Put*", "s3:GetObjectTagging", "s3:DeleteObject*"]
        resources = ["${aws_s3_bucket.data[0].arn}/*"]
        effect    = "Allow"
      },
      ]
      : []
    )
}

resource "aws_s3_bucket" "data" {
  count  = local.has_data_bucket ? 1 : 0
  bucket = var.data_s3_bucket
  acl    = "private"
}
