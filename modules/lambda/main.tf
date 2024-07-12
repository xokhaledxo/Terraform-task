# Define the Lambda function
resource "aws_lambda_function" "db_function" {
  function_name = "dbFunction"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "modules/lambda/lambda_function.zip"
  

  environment {
    variables = {
      DB_HOST     = var.db_host
      DB_USERNAME = var.db_username
      DB_PASSWORD = var.db_password
      DB_NAME     = var.db_name
    }
  }
}

resource "local_file" "lambda_function" {
  content = <<EOF
import os
import pymysql

def lambda_handler(event, context):
    db_host = os.environ['DB_HOST']
    db_username = os.environ['DB_USERNAME']
    db_password = os.environ['DB_PASSWORD']
    db_name = os.environ['DB_NAME']
    
    connection = pymysql.connect(
        host=db_host,
        user=db_username,
        password=db_password,
        database=db_name
    )
    
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT NOW()")
            result = cursor.fetchone()
            print("Current time: ", result)
    finally:
        connection.close()
    
    return {
        'statusCode': 200,
        'body': 'Connected to RDS and retrieved current time: {}'.format(result)
    }
EOF
  filename = "modules/lambda/lambda_function.py"
}


data "archive_file" "lambda_function_zip" {
  type        = "zip"
  source_file = local_file.lambda_function.filename
  output_path = "modules/lambda/lambda_function.zip"
}


# Define the IAM role for Lambda execution
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# Attach a policy to the IAM role
resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:DescribeDBInstances",
          "rds:Connect"
        ]
        Effect = "Allow"
        Resource = "*"
      },
    ]
  })

  depends_on = [aws_iam_role.lambda_exec]
}
