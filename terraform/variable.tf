########
#GLOBAL#
########
variable "project" {
  type        = string
  description = "value"
  default     = "microservices"
}
variable "region" {
  type        = string
  description = "Região do que deve ser criado o recurso"
  default     = "us-east-1"
}

variable "tags" {
  type = map(string)
  default = {
    terraform   = "true"
    environment = "QA"
    project     = "microservices"
  }
}

variable "environment" {
  type        = string
  description = "value"
  default     = "qa"
}

#########
#LAMBDA #
#########
/*variable "filename" {
    type    = string
    default = "/home/gabriel.pires/Documentos/gabriel/python/app/app.zip"
}
variable "handler" {
    type    = string
    default = "app.lambda_handler"
    #O valor do prefixo do nome precisa ser o mesmo do ponto de execução do seu python. No nosso contexto ficaria app.lambda_handler o valor .lambda_handler deve sempre existir caso contrario não vai funcionar

}
variable "description" {
    type    = string
    default = "https://github.com/The-Kadabra/AWS-Lambda-Python-Boto3"
}
variable "runtime" {
    type    = string
    default = "python3.9"
}
variable "timeout" {
    type    = number
    default = 900
}
variable "memory_size" {
    default = "512"
}*/

############
#MODULE-VPC#
############

variable "private_subnet_suffix" {
    description = "Nome que se pretende dar a essa SUBNET"
    type        = string
    default     = "private"
}

variable "public_subnet_suffix" {
    description = "Nome que se pretende dar a essa SUBNET"
    type        = string
    default     = "public"
}


#############
#Data Subnet#
#############

variable "vpc_subnet" {
  description = "lista das subnets"
  type        = list(string)
  default     = ["microservices-private-us-east-1a","microservices-private-us-east-1b"]
}