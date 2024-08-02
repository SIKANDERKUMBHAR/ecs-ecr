# Terraform ECS Deployment

This Terraform configuration sets up a robust and scalable infrastructure on AWS, primarily focusing on deploying applications using Amazon ECS (Elastic Container Service) with Fargate.

## 🚀 Features

- **ECS Cluster**: Easily deployable and scalable container management
- **Application Load Balancer**: Efficient distribution of incoming traffic
- **VPC Configuration**: Secure network setup with public and private subnets
- **Auto Scaling**: Automatically adjust the number of tasks based on demand
- **CloudWatch Integration**: Comprehensive logging and monitoring
- **Security Groups**: Properly configured for enhanced security
- **IAM Roles**: Least privilege principle applied for ECS tasks

## 🏗️ Infrastructure Components

1. **VPC and Networking**:
   - Creates a custom VPC with public and private subnets
   - Sets up Internet Gateway and NAT Gateways for secure outbound traffic
   - Configures route tables for proper network isolation

2. **ECS Cluster and Service**:
   - Deploys an ECS cluster using Fargate for serverless container management
   - Defines task definitions with customizable CPU and memory allocation
   - Sets up an ECS service for maintaining desired task count

3. **Load Balancing**:
   - Provisions an Application Load Balancer (ALB) for distributing traffic
   - Configures target groups and listeners for routing requests to ECS tasks

4. **Security**:
   - Implements security groups for ALB and ECS tasks
   - Sets up IAM roles with appropriate permissions for ECS task execution

5. **Monitoring and Logging**:
   - Integrates with CloudWatch for centralized logging
   - Configures health checks for the target group

## 🛠️ Usage

1. Ensure you have Terraform installed and AWS credentials configured.
2. Clone this repository.
3. Navigate to the project directory.
4. Run the following commands:

   ```
   terraform init
   terraform plan
   terraform apply
   ```

5. After successful application, the ALB DNS name will be outputted for accessing your application.

## 🔧 Customization

This configuration uses variables extensively, allowing for easy customization:

- Adjust the `app_image` variable to deploy your own container image.
- Modify `fargate_cpu` and `fargate_memory` to allocate resources as needed.
- Customize the `desired_count` to set the number of tasks you want running.

## 🌟 Benefits

- **Infrastructure as Code**: Easily version, share, and replicate your infrastructure.
- **Scalability**: Designed to handle increased load by adjusting task count.
- **Cost-Effective**: Uses Fargate to avoid managing EC2 instances.
- **Security-Focused**: Implements best practices for network and access management.
- **Maintainable**: Well-structured code with clear separation of concerns.



This project is open-source and available under the MIT License.
