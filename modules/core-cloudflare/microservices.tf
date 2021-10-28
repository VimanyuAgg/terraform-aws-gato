###############################################
#             Base Path Mapping               |
#    Used to map custom domain with a stage   |
###############################################

resource "aws_apigatewayv2_api_mapping" "stateless_microservices" {
  count           = length(var.http_apis)
  stage           = var.http_apis[count.index].stage
  api_id          = var.http_apis[count.index].id
  api_mapping_key = var.http_apis[count.index].key
  domain_name     = aws_apigatewayv2_domain_name.stateless.domain_name
}

resource "aws_apigatewayv2_api_mapping" "statefull_microservices" {
  count           = length(var.ws_apis)
  stage           = var.ws_apis[count.index].stage
  api_id          = var.ws_apis[count.index].id
  api_mapping_key = var.ws_apis[count.index].key
  domain_name     = aws_apigatewayv2_domain_name.statefull.domain_name
}
