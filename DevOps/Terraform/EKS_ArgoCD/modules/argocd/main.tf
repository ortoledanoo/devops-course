resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  set {
    name  = "server.insecure"
    value = "true"
  }
  
  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }
}

resource "kubernetes_ingress_v1" "argocd_ingress" {
  metadata {
    name      = "argocd-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class"                    = "alb"
      "alb.ingress.kubernetes.io/scheme"               = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"          = "ip"
      "alb.ingress.kubernetes.io/listen-ports"         = jsonencode([{"HTTP" = 80}])
      "alb.ingress.kubernetes.io/healthcheck-path"     = "/healthz"
      "alb.ingress.kubernetes.io/healthcheck-port"     = "traffic-port"
      "alb.ingress.kubernetes.io/success-codes"        = "200-399"
      "alb.ingress.kubernetes.io/backend-protocol"     = "HTTP"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "argocd-server"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
