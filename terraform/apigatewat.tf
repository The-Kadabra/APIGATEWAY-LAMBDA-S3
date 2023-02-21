module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = format("API-%s", var.project)
  description   = "API Gateway"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  # Custom domain
  create_api_domain_name = false

  #vpc link
  create_vpc_link = false

  # Access logs
  default_stage_access_log_destination_arn = null
  default_stage_access_log_format          = null

  # Routes and integrations
  integrations = {
    "GET /" = {
      lambda_arn             = resource.aws_lambda_function.main.arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "GET /users" = {
      lambda_arn = resource.aws_lambda_function.main.arn
    }
  }

  tags = var.tags
}