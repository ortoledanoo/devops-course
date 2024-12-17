terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2" # Latest From Doc
    }
  }
}
# Set Resource - Docker Image
resource "docker_image" "nginx" { 
  name         = "ortoledanoo/weather-app"
  keep_locally = false # Delete Image After Destroy and NOT Save Locally
}

#Set Resource - Docker Container
resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "weather-app"

  ports {
    internal = 5000
    external = 8000
  }
}
