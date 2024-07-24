# In this task I will be doing the following:

1.	A VPC with two subnets (public and private) with any CIDR blocks.
2.	An EC2 instance in the private subnet.
3.	An RDS PostgreSQL database instance in the private subnet.
4.	security groups to allow traffic between the components and external access to the web server (Allow HTTP (80) and SSH (22) from anywhere in both subnets).
5.	IAM role for the EC2 instances with a policy that allows reading from an S3 bucket.
6.	Route 53 to create a custom domain for accessing the web application.
7.	Enable encryption for the RDS instance and the S3 bucket.
8.	Create a Lambda function that interacts with the RDS PostgreSQL database.
9.	Set up an API Gateway with a REST API and Configure API Gateway to route requests to the Lambda function.


# How to set up and tear down the infrastructure.
## You will need to: 
- Install Terraform.
- AWS CLI configured with your credentials.
