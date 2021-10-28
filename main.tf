module "gato" {
  source      = "./modules/core-route53"
  prefix      = var.prefix
  common_tags = var.common_tags

  # DNS
  cert_arn    = var.cert_arn
  r53_zone_id = var.r53_zone_id
  domain_name = var.domain_name
  sub_domains = var.sub_domains

  # Rest APIS
  http_apis = var.http_apis
  ws_apis   = var.ws_apis
}
