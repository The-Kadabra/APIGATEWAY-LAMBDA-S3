#################################################
#fonte de dados para obter acesso ao ID da conta#
#################################################
data "aws_caller_identity" "current" {}

######################
### LAMBDA Fuction ###
#####################

###############
#Policy Lambda#
###############
data "aws_iam_policy_document" "policy" {
    #permissões default de funcionamento do Lambda na AWS
    statement {
        effect        = "Allow" 
        actions       = [
                        "lambda:InvokeFunction",
                        "ec2:CreateNetworkInterface",
                        "ec2:DescribeInstances",
                        "ec2:DescribeNetworkInterfaces",
                        "ec2:DeleteNetworkInterface",
                        "ec2:AttachNetworkInterface"
                        ]
        resources     = [
                        "*"
                        ]
    }
    #Permissões para o Lambda consumir o Bucket S3
    statement {
        effect           = "Allow"
        actions          =  [
                "s3:*"
                        ]
        resources = [
                    "*"
                    ]
    }
    #permissão para criar e gravar Logs
    statement {
        effect           = "Allow"
        actions          =  [
                "logs:*"
                        ]
        resources = [
                "*"
                    ]
    }
    
}

##################
#Data role Slicer#
##################

data "aws_iam_policy_document" "role"{
    statement {
        effect = "Allow"
        actions =   [
                "sts:AssumeRole"
                    ]
        principals {
                    type        =   "Service"
                    identifiers =   [
                                    "lambda.amazonaws.com",
                                    ]
        }        
    }
}



##################################
#Data Subnet - Consumindo de app #
##################################
data "aws_subnet" "subnet_app" {
    count     = length(var.vpc_subnet)
        filter {
            name    = "tag:Name"
            values  = [
                element(var.vpc_subnet, count.index)
        ]
    }
}

##########################################
#Zip no arquivo python durante a execução#
##########################################

data "archive_file" "lambda_my_function" {
    type             = "zip"
    source_file      = "../../projeto_apigtw/python/app.py"
    output_file_mode = "0666"
    output_path      = "../../projeto_apigtw/python/app.zip"
}