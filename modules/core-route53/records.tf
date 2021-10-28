#==========================#
#     Route 53 Records     |
#==========================#

resource "aws_route53_record" "stateless" {
  zone_id = var.r53_zone_id
  name    = var.sub_domains.stateless
  type    = "A"

  alias {
    name                   = aws_apigatewayv2_domain_name.stateless.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.stateless.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "statefull" {
  zone_id = var.r53_zone_id
  name    = var.sub_domains.statefull
  type    = "A"

  alias {
    name                   = aws_apigatewayv2_domain_name.statefull.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.statefull.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = true
  }
}
