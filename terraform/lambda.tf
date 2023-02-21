#################
#LAMBDA FUNCTION#
#################

resource "aws_lambda_function" "main" {

  filename         = var.filename
  function_name    = var.project
  handler          = var.handler
  role             = resource.aws_iam_role.lambda.arn
  description      = var.description
  memory_size      = var.memory_size
  runtime          = var.runtime
  timeout          = var.timeout
  publish          = true
  source_code_hash = filebase64sha256(var.filename)

  vpc_config {
    subnet_ids         = data.aws_subnet.subnet_app[*].id
    security_group_ids = [resource.aws_security_group.this.id]
  }
  depends_on = [
    module.vpc
  ]
}

################
#TRIGGER-LAMBDA#
################
#OS ESTUDOS PARAM AQUI. PRECISO ENTENDER COMO REALIZAR A INTEGRAÇÃO ENTRE APIGTW E LAMBDA
resource "aws_apigatewayv2_integration" "this" {
  api_id                              = module.api_gateway.apigatewayv2_api_id
  integration_type                    = "AWS_PROXY"
  integration_method                  = "GET"
  integration_uri                     = resource.aws_lambda_function.main.invoke_arn
}
