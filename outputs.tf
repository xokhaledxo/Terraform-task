output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.db_instance_address
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "api_gateway_endpoint" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}
