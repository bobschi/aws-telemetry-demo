import boto3
import json

dynamodb =  boto3.resource('dynamodb')
table = dynamodb.Table('telemetry')

def collect_telemetry(event, context):
    """
    Handle incoming events by storing valid JSON telemetry into DynamoDB.
    """
    try:
        json.loads(event)
    except json.JSONDecodeError:
        # Do nothing for now. Maybe write to websockter later.
        # Final form: the AWS logging thingy?
        ...
    