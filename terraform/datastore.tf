resource "aws_dynamodb_table" "telemetry-example-datastore" {
  name           = "Telemetry"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "unqiue_id"
  range_key      = "timestamp"

  attribute {
    name = "unqiue_id"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "S"
  }

  tags = {
    Name = "TelemetryDataStore"
  }
}
