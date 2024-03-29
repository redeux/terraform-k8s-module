resource "kubernetes_role_binding" "tfc-role-binding" {
  metadata {
    name = "${var.namespace}-sync-workspace"
    namespace = var.namespace
    labels = {
      app = var.namespace
    }
  }
  role_ref {
    kind      = "Role"
    name      = kubernetes_role.tfc-role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    # name      = "${var.namespace}-sync-workspace"
    name = kubernetes_service_account.tfc-service-account.metadata[0].name
    namespace = var.namespace
  }
}