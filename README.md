# README

I am collecting my progress towards accomplishing a simple challenge here. The challenge will help to get me acquainted with [terraform](https://terraform.io), [DynamoDB](https://aws.amazon.com/dynamodb/) and [AWS](https://aws.amazon.com/?nc2=h_lg) in general.

The Challenge: Create a solution to push arbitrary data onto some sort of permanent storage using state-of-the-art frameworks.

## To-Do List

- [ ] Create a free _AWS_ Trial account.
- [ ] Use _terraform_ to describe the necessary infrastructure.
- [ ] Create an API Gateway V2 Endpoint offering clients to connect via websocket.
- [ ] A Lambda Function with Python Code will process every request.
    - [ ] Check if every message is valid JSON.
    - [ ] Push all valid JSON into a DynamoDB Instance denoting the websocket's connection Client ID, timestamp and JSON as string.
    - [ ] Index the Table with a random Unique ID as hash and the timestamp as range index.
- [ ] For debugging, get familiar with [websocat](https://github.com/vi/websocat)
