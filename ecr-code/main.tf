# Check if the specified ECR repository already exists
data "aws_ecr_repository" "existing_repo" {
  name = var.repository_name
}

# Create the ECR repository only if it doesn't exist
resource "aws_ecr_repository" "repo" {
  count = length(try([data.aws_ecr_repository.existing_repo], [])) == 0 ? 1 : 0
  name  = var.repository_name
}

# Output the URL of the ECR repository
output "repository_url" {
  value = length(try([data.aws_ecr_repository.existing_repo], [])) > 0 ? data.aws_ecr_repository.existing_repo.repository_url : aws_ecr_repository.repo[0].repository_url
}

# Build and push the Docker image to the ECR repository
resource "null_resource" "docker_build_and_push" {
  provisioner "local-exec" {
    command = <<EOT
      # Login to the ECR registry
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin $(terraform output -raw repository_url)
      
      # Build the Docker image and tag it with 'latest'
      docker build -t $(terraform output -raw repository_url):latest .
      
      # Push the Docker image to the ECR repository
      docker push $(terraform output -raw repository_url):latest
    EOT
  }

  # Ensure that the Docker build and push only happen after the repository is created or found
  depends_on = [
    aws_ecr_repository.repo,
    data.aws_ecr_repository.existing_repo
  ]
}
