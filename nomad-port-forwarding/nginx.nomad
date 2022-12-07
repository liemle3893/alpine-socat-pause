job "demo" {
  datacenters = ["dc1"]
  region      = "global"
  group "webserver" {
    network {
      port "http" {
        to = 80
      }
      mode = "host" 
    }
    task "socat-pause" {
      lifecycle {
        hook    = "poststart"
        sidecar = true
      }
      driver = "docker"
      config {
        image = "saboteurkid/socat-pause:1.0"
      }
      resources {
        cpu    = 10
        memory = 10
      }
    }
    task "demo-nginx" {
      driver = "docker"
      config {
        image = "nginx"
        ports = ["http"]
      }
    }
  }
}
