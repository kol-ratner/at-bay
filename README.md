# AWS Scalable Hello World

A highly available and scalable "Hello World" website deployed on AWS.

## Architecture
- Multi-AZ deployment across 2 availability zones
- Application Load Balancer for traffic distribution
- Auto Scaling Group for handling varying loads
- EC2 instances running Apache web server
- Security groups for access control

## Features
- Automatic scaling based on demand
- High availability across multiple AZs
- Cost-efficient with scale-in during low traffic



## Getting Started

First createa a .env at the root of the repo with the following variables:
```
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_REGION="eu-west-1"
```

Next you can run the init script to create the github actions related resources:
```
./getting_started
```

