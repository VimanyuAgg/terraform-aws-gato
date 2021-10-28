# Terraform AWS Gato

Manage Global API Gateway Resources and API Gateway resources for provisioning custom domain, mapping the domain with 
multiple API Gateway HTTP/WS APIs and API Gateway Stages and Exposing the APIs through route53 or cloudflare records.

## Prerequisites

- AWS API Gateway HTTP or Websocket API and its Stage.
- A route53 or cloudflare zone (That you own of course)
- An ACM certificate for your API Gateway custom domains

## Usage

```hcl
module "gato" {
  source      = "git::https://github.com/obytes/terraform-aws-gato.git//modules/core-route53"
  prefix      = local.prefix
  common_tags = local.common_tags

  # DNS
  r53_zone_id = aws_route53_zone.prerequisite.zone_id
  cert_arn    = aws_acm_certificate.prerequisite.arn
  domain_name = "kodhive.com"
  sub_domains = {
    stateless = "api"
    statefull = "ws"
  }

  # Rest APIS
  http_apis = [
    {
      id    = module.aws_lambda_api_accounts.http_api_id
      key   = "accounts"
      stage = module.aws_lambda_api_accounts.http_api_stage_name
    },
    {
      id    = module.aws_lambda_api_products.http_api_id
      key   = "products"
      stage = module.aws_lambda_api_products.http_api_stage_name
    },
    {
      id    = module.aws_lambda_api_payment.http_api_id
      key   = "payment"
      stage = module.aws_lambda_api_payment.http_api_stage_name
    },
  ]
  ws_apis = [
    {
      id    = module.push_notification_api.ws_api_id
      key   = "push"
      stage = module.push_notification_api.ws_api_stage_name
    },
  ]
}
```

This will expose the following APIs:

- https://api.kodhive.com/accounts/...
- https://api.kodhive.com/products/...
- https://api.kodhive.com/payment/...
- https://ws.kodhive.com/push/...
