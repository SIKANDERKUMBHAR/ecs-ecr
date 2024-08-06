data "aws_ecr_repository" "existing_repo" {
  name = var.repository_name
}

resource "aws_ecr_repository" "repo" {
  count = length(try([data.aws_ecr_repository.existing_repo], [])) == 0 ? 1 : 0
  name  = var.repository_name
}

output "repository_url" {
  value = length(try([data.aws_ecr_repository.existing_repo], [])) > 0 ? data.aws_ecr_repository.existing_repo.repository_url : aws_ecr_repository.repo[0].repository_url
}

resource "null_resource" "docker_build_and_push" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin $(terraform output -raw repository_url)
      docker build -t $(terraform output -raw repository_url):latest .
      docker push $(terraform output -raw repository_url):latest
    EOT
  }

  depends_on = [
    aws_ecr_repository.repo,
    data.aws_ecr_repository.existing_repo
  ]
}
