provider "kubernetes" {}
provider "kubernetes-alpha" {}

resource "kubernetes_namespace" "greetings" {
  metadata {
    name = var.NAMESPACE
  }
}

resource "kubernetes_secret" "workspace-secret" {
  metadata {
    name      = "workspacesecrets"
    namespace = kubernetes_namespace.greetings.metadata[0].name
  }

  data = {
    AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  }
}

module "terraform-k8s" {
  source = "./terraform-k8s"

  workspace_secrets = kubernetes_secret.workspace-secret.metadata[0].name  
  namespace       = var.NAMESPACE
  tfc_credentials = file(var.TFC_CREDENTIALS)

}