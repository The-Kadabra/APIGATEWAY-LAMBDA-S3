#################################################
#fonte de dados para obter acesso ao ID da conta#
#################################################
output "account_id" {
  description = "ID da conta AWS que está sendo alterada"
  value       = data.aws_caller_identity.current.account_id
}

############
#Backend-S3#
############

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}