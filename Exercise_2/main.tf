
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Deploy an AWS Lambda Function
resource "aws_lambda_function" "project_two_lambda" {
  filename      = "greet_lambda.zip"
  function_name = "project_two_lambda_function"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_handler"

  runtime = "python3.8"

  environment {
    variables = {
      greeting = "Hello Terraform from Terraform!!!"
    }
  }
}
