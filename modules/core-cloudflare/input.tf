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

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID"
}

variable "domain_name" {
  description = "API Gateway domain name"
}

variable "sub_domains" {
  description = "Subdomains for statefull()"
  type = object({
    stateless = string
    statefull = string
    docs      = string
  })
  default = {
    stateless = "api"
    statefull = "live"
    docs      = "docs"
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
