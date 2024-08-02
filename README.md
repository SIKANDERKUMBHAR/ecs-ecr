# Terraform ECS Deployment with GitHub Actions CI/CD

This project sets up a robust and scalable infrastructure on AWS using Terraform, primarily focusing on deploying applications using Amazon ECS (Elastic Container Service) with Fargate. It also includes a GitHub Actions workflow for continuous integration and deployment.

## 🚀 Features

- **VPC Configuration**: Custom VPC setup with public and private subnets
- **ECS Cluster**: Easily deployable and scalable container management
- **Application Load Balancer**: Efficient distribution of incoming traffic
- **Auto Scaling**: Automatically adjust the number of tasks based on demand
- **CloudWatch Integration**: Comprehensive logging and monitoring
- **Security Groups**: Properly configured for enhanced security
- **IAM Roles**: Least privilege principle applied for ECS tasks
- **GitHub Actions**: Automated CI/CD pipeline for continuous deployment

## 🏗️ Infrastructure Components

1. **VPC and Networking**:
   - Creates a custom VPC with a CIDR block of 172.17.0.0/16
   - Sets up public and private subnets across multiple Availability Zones
   - Configures Internet Gateway for public subnets
   - Sets up NAT Gateways in public subnets for outbound internet access from private subnets
   - Configures route tables for proper network isolation and internet access

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

6. **CI/CD Pipeline**:
   - Uses GitHub Actions for automated deployments
   - Builds and pushes Docker images to Amazon ECR
   - Updates ECS task definitions and deploys to ECS

## 🛠️ Usage

### Terraform Deployment

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

### GitHub Actions Workflow

The included GitHub Actions workflow automates the deployment process:

1. On push to the `main` branch, the workflow is triggered.
2. It builds a Docker image and pushes it to Amazon ECR.
3. The ECS task definition is updated with the new image.
4. The updated task is deployed to the ECS cluster.

To use the GitHub Actions workflow:

1. Ensure your repository has the necessary secrets set up:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
2. Customize the `.github/workflows/deploy.yml` file if needed.
3. Push changes to the `main` branch to trigger the deployment.

## 🔧 Customization

This configuration uses variables extensively, allowing for easy customization:

- Adjust the `app_image` variable to deploy your own container image.
- Modify `fargate_cpu` and `fargate_memory` to allocate resources as needed.
- Customize the `desired_count` to set the number of tasks you want running.
- Update the `az_count` variable to change the number of Availability Zones used.
- Modify the VPC CIDR block in the `aws_vpc` resource if needed.
- Update the GitHub Actions workflow to match your specific deployment needs.

## 🌟 Benefits

- **Isolated Network**: Custom VPC provides network isolation and security.
- **High Availability**: Multi-AZ setup ensures resilience and fault tolerance.
- **Infrastructure as Code**: Easily version, share, and replicate your infrastructure.
- **Scalability**: Designed to handle increased load by adjusting task count.
- **Cost-Effective**: Uses Fargate to avoid managing EC2 instances.
- **Security-Focused**: Implements best practices for network and access management.
- **Maintainable**: Well-structured code with clear separation of concerns.
- **Automated Deployments**: Continuous deployment with GitHub Actions.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
