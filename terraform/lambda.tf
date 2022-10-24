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

  handler = "telemetry.collect_telemetry" // TODO: Extrat to vars file
  runtime = "python3.9"                   // TODO: Extrat to vars file

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