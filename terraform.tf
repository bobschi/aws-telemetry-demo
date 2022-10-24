terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
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