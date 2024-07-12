output "lambda_function_arn" {
  value = aws_lambda_function.db_function.arn
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.db_function.invoke_arn
}
