###############################################
#                  API Domain                 |
#    Use custom domain instad of invoke url   |
###############################################
resource "aws_apigatewayv2_domain_name" "stateless" {
  domain_name = "${var.sub_domains.stateless}.${var.domain_name}"

  domain_name_configuration {
    certificate_arn = var.cert_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_apigatewayv2_domain_name" "statefull" {
  domain_name = "${var.sub_domains.statefull}.${var.domain_name}"

  domain_name_configuration {
    certificate_arn = var.cert_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}
