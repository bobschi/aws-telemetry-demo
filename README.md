# README

I am collecting my progress towards accomplishing a simple challenge here. The challenge will help to get me acquainted with [terraform](https://terraform.io), [DynamoDB](https://aws.amazon.com/dynamodb/) and [AWS](https://aws.amazon.com/?nc2=h_lg) in general.

The Challenge: Create a solution to push arbitrary data onto some sort of permanent storage using state-of-the-art frameworks.

## Deploying with _terraform_

To deploy, install _terraform_ and _aws-cli_ using the [official tutorial](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started).

Option the secrets for your AWS user and set them as environment variables:

```shell
export AWS_SECRET_ACCESS_KEY=your_secret_access_key_goes_here
export AWS_ACCESS_KEY_ID=your_access_key_goes_here
```

There are other ways to do this: shared configuration files, integrations with tools to manage your secrets. We are using this for now because it's quick and just works.

## To-Do List

- [x] Create a free _AWS_ Trial account.
- [ ] Use _terraform_ to describe the necessary infrastructure.
- [ ] Create an API Gateway V2 Endpoint offering clients to connect via websocket.
- [ ] A Lambda Function with Python Code will process every request.
    - [ ] Check if every message is valid JSON.
    - [ ] Push all valid JSON into a DynamoDB Instance denoting the websocket's connection Client ID, timestamp and JSON as string.
    - [ ] Index the Table with a random Unique ID as hash and the timestamp as range index.
- [ ] For debugging, get familiar with [websocat](https://github.com/vi/websocat)

## Ideas

- Think about automating deployments with GitHub? Something, something, CI/CD pipelines.

## Tutorials Used and Docs Referenced

- [Setup Terraform with AWS on Mac OS](https://jamesmiller.blog/terraform-aws-mac-setup/)
- [Terraform: AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform: Get Started - AWS](https://learn.hashicorp.com/collections/terraform/aws-get-started)