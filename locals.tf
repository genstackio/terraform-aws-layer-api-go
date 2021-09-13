locals {
  lambda_name = "${var.env}-api-${var.name}"
  has_data_bucket = ("" != var.data_s3_bucket) && (null != var.data_s3_bucket)
}