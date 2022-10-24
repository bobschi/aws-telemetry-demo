terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_apigatewayv2_api" "telemetry_collection_endpoint" {
  name          = "telemetry-example-telemetry-collection-endpoint"
  description   = "The API Gateway V2 Websocket for the Telemetry Collection Example"
  protocol_type = "WEBSOCKET"
  tags = {
    Name = "TelemetryExampleTelemetryCollectionEndpoint"
  }
}

variable "lambda_root" {
  type        = string
  description = "The relative path to the source of the lambda"
  default     = "../lambda"
}

data "archive_file" "python_lambda_source" {
  type        = "zip"
  source_dir  = var.lambda_root
  output_path = "telemetry.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "telemetry-collection-lambda"
  role          = aws_iam_role.lambda_role.arn
  filename      = data.archive_file.python_lambda_source.output_path

  handler = "lambda_handler" // TODO: Extrat to vars file
  runtime = "python3.9"      // TODO: Extrat to vars file

  environment {
    variables = {
      LOG_LEVEL = "DEBUG" // TODO: Extrat to vars file
    }
  }

  reserved_concurrent_executions = 1 // One for now, TODO: Extrat to vars file

  tags = {
    Name = "TelemetryCollectionLambda"
  }
}