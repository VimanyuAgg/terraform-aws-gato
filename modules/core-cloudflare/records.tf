#==========================#
#     Route 53 Records     |
#==========================#

resource "cloudflare_record" "stateless" {
  zone_id = var.cloudflare_zone_id
  name    = var.sub_domains.stateless
  type    = "CNAME"
  proxied = true
  value   = aws_apigatewayv2_domain_name.stateless.domain_name_configuration[0].target_domain_name
}

resource "cloudflare_record" "statefull" {
  zone_id = var.cloudflare_zone_id
  name    = var.sub_domains.statefull
  type    = "CNAME"
  proxied = true
  value   = aws_apigatewayv2_domain_name.statefull.domain_name_configuration[0].target_domain_name
}
