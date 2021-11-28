variable "env" {
  type = string
}
variable "name" {
  type = string
}
variable "dns" {
  type = string
}
variable "dns_zone" {
  type = string
}
variable "package_file" {
  type    = string
  default = null
}
variable "package_s3_bucket" {
  type    = string
  default = null
}
variable "package_s3_key" {
  type    = string
  default = null
}
variable "data_s3_bucket" {
  type    = string
  default = null
}
variable "runtime" {
  type    = string
  default = "go1.x"
}
variable "timeout" {
  type    = number
  default = 29
}
variable "memory_size" {
  type    = number
  default = 128
}
variable "handler" {
  type    = string
  default = "main"
}
variable "variables" {
  type    = map(string)
  default = {}
}
variable "policy_statements" {
  type = list(
    object({
      actions   = list(string),
      resources = list(string),
      effect    = string
    })
  )
  default = []
}
variable "geolocations" {
  type    = list(string)
  default = []
}
variable "price_class" {
  type    = string
  default = "PriceClass_100"
}
variable "forward_query_string" {
  type    = bool
  default = null
}
variable "publish" {
  type    = bool
  default = null
}
variable "lambda_name" {
  type    = string
  default = null
}
variable "accesslogs_s3_bucket" {
  type    = string
  default = null
}