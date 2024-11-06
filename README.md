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
Let's start by generating github actions resources so that we can implement a standard SDLC process to make changes to our terraform confguration via automation that runs on Git triggers. The intention here is that the github actions resources would normally be created by Account Factory customizations on a per account basis. The getting_started script mocks that out for you, so that the github actions process can work against the core `terraform` resources that make up the solution.

### Step 1
First create a `.env` file at the root of the repo with the following variables, be sure to populate the values with your aws access key and secret:
```
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_REGION="eu-west-1"
```

### Step 2
Next you can run the init script to create the github actions related resources:
```
./getting_started
```

### Step 3
Next in order to deploy the solution you will need to simply uncomment out all resources in each of the files in the terraform directory.

I recommend opening each file that contains commented out code and simply running:
```
cmd + a
cmd + /
```

Once all of the files are uncommented you can push your changes to a branch and open a PR against the `main` branch.

You will see github actions run both on PR, which generates a terraform plan, and of course on merge to main, which will deploy the solution.


## Validating the Solution

I spent time validating that autoscaling works correctly by running vegeta to generate load. I also included a screenshot of the autoscaling group events to show that it scales in and out as expected. In addition I included a screenshot of the ALB metrics during the load test. I would like to point out that early on in the load test, around the 12:00 timestamp you can see that 5xx responses from the ALB increase sharply and eventually drop off entirely. This correlates with the initial autoscaling event that scaled the webserver from 1 to 2 instances. It would seem that the dropoff in 5xx responses is due to the increased scale of the web server instances.


### Validation Reference
vegeta's source code can be viewed at: https://github.com/tsenart/vegeta

To install vegeta on mac you can run:
```
brew install vegeta
```

There is a load testing script stored at `validation/load_test` you can run this script to generate load against the solution. Keep in mind that its currently set to run for 30 minutes. This is to be able to watch scaling as traffic increases load on CPU of the web servers over time.
```
cd validation
./load_test
```
