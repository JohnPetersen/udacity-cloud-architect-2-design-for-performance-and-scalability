# TODO: Define the output variable for the lambda function.
output "lambda_invoke_arn" {
  description = "Invoke ARN of Udacity Lambda Function"
  value       = aws_lambda_function.project_two_lambda.invoke_arn
}
