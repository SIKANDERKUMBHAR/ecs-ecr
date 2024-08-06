variable "region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "ap-southeast-1"
}

variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "simple-website"
}
