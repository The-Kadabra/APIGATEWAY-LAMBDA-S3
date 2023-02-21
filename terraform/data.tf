#################################################
#fonte de dados para obter acesso ao ID da conta#
#################################################
data "aws_caller_identity" "current" {}

##################################
#Data Subnet - Consumindo de app #
##################################
#data "aws_subnet" "subnet_app" {
#    count     = length(lookup(var.vpc_subnet)) #ajustar o valor
#        filter {
#            name    = "tag:Name"
#            values  = [
#                element(lookup(var.vpc_subnet), count.index)#ajustar o valor
#        ]
#    }
#}