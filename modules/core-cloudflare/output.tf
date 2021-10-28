output "dist" {
  value = {
    stateless = {
      domain_name = aws_apigatewayv2_domain_name.stateless.domain_name_configuration[0].target_domain_name
      zone_id     = aws_apigatewayv2_domain_name.stateless.domain_name_configuration[0].hosted_zone_id
    }
    statefull = {
      domain_name = aws_apigatewayv2_domain_name.statefull.domain_name_configuration[0].target_domain_name
      zone_id     = aws_apigatewayv2_domain_name.statefull.domain_name_configuration[0].hosted_zone_id
    }
  }
}
