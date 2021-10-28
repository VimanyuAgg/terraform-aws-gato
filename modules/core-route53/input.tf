######################
#     VARIABLES      |
######################
variable "prefix" {}
variable "common_tags" {
  type = map(string)
}

variable "cert_arn" {
  description = "AWS ACM Certificate ARN"
}

variable "r53_zone_id" {
  description = "Route53 zone ID"
}

variable "domain_name" {
  description = "API Gateway domain name"
}

variable "sub_domains" {
  description = "Subdomains for statefull(HTTP) and stateless(WS) APIs"
  type = object({
    stateless = string
    statefull = string
  })
  default = {
    stateless = "api"
    statefull = "live"
  }
}

variable "http_apis" {
  description = "A map of rest/http apis ids"
  type = list(object({
    id    = string
    key   = string
    stage = string
  }))
}

variable "ws_apis" {
  description = "A map of ws apis ids"
  type = list(object({
    id    = string
    key   = string
    stage = string
  }))
}
