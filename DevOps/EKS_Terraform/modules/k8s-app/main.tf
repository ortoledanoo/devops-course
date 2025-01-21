resource "kubernetes_deployment_v1" "weather_app" {
  metadata {
    name = "weather-app-deployment"
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = "weather-app-container"
          image = var.image_name

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "weather_app" {
  metadata {
    name = "weather-app-service"
    labels = {
      app = var.app_name
    }
  }

  spec {
    type = var.service_type
    
    selector = {
      app = var.app_name
    }

    port {
      port        = 80
      target_port = 5000
      protocol    = "TCP"
    }
  }
}

resource "kubernetes_ingress_v1" "weather_app" {
  metadata {
    name = "weather-app-ingress"
    annotations = {
      "alb.ingress.kubernetes.io/scheme"                     = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"                = "ip"
      "alb.ingress.kubernetes.io/listen-ports"               = "[{\"HTTP\": 80}]"
      "alb.ingress.kubernetes.io/healthcheck-path"           = "/"
      "alb.ingress.kubernetes.io/healthcheck-interval-seconds" = "15"
      "alb.ingress.kubernetes.io/healthcheck-timeout-seconds" = "5"
      "alb.ingress.kubernetes.io/success-codes"              = "200-399"
      "alb.ingress.kubernetes.io/load-balancer-attributes"   = "routing.http.drop_invalid_header_fields.enabled=true"
      "alb.ingress.kubernetes.io/target-group-attributes"    = "deregistration_delay.timeout_seconds=30"
      "alb.ingress.kubernetes.io/group.name"                 = "weather-app"
      "alb.ingress.kubernetes.io/group.order"                = "1"
      "alb.ingress.kubernetes.io/backend-protocol"           = "HTTP"
    }
  }

  spec {
    ingress_class_name = "alb"
    
    rule {
      http {
        path {
          path      = "/*"
          path_type = "ImplementationSpecific"
          
          backend {
            service {
              name = kubernetes_service_v1.weather_app.metadata[0].name
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
