######################
#     VARIABLES      |
######################

# General
# -------
variable "prefix" {
  type        = "string"
  description = "Used for prefixing resources and avoid conflicts"
}

variable "common_tags" {
  type        = map(string)
  description = "Common resources tags"
}

# DNS
# ----------
variable "r53_zone_id" {
  description = "Route 53 Zone ID"
}

variable "cert_arn" {
  description = "ACM Crtificate ARN"
}

variable "domain_name" {
  default     = "kodhive.com"
  description = "Domain name for api gateway custom domain"
}

variable "sub_domains" {
  type = object({
    stateless = string
    statefull = string
    docs      = string
  })
  description = "A map of subdomains"
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
