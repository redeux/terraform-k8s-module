variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "NAMESPACE" {
  type = string
}

variable "TFC_CREDENTIALS" {
  # File path location of Terraform Cloud credentials
  type = string
}

# variable "TERRAFORM_K8S_HELM_CHART" {
#   # File path location of Terraform-k8s Helm Chart
#   type    = string
# }

# variable "TERRAFORM_K8S_HELM_RELEASE" {
#   # Helm release name
#   type    = string
# }

