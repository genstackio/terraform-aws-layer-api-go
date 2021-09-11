module "api" {
  source               = "genstackio/api-lambda/aws"
  version              = "0.1.1"
  name                 = var.name
  env                  = var.env
  lambda_arn           = module.lambda.arn
  dns                  = var.dns
  dns_zone             = var.dns_zone
  forward_query_string = var.forward_query_string
  price_class          = var.price_class
  geolocations         = var.geolocations
  providers = {
    aws     = aws
    aws.acm = aws.acm
  }
}

module "lambda" {
  source            = "genstackio/lambda/aws"
  version           = "0.1.12"
  package_file      = var.package_file
  s3_bucket         = var.s3_bucket
  s3_key            = var.s3_key
  name              = local.lambda_name
  runtime           = var.runtime
  handler           = var.handler
  timeout           = var.timeout
  memory_size       = var.memory_size
  variables         = var.variables
  publish           = var.publish
  policy_statements = var.policy_statements
}
