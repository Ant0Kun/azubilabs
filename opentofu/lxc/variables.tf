variable "lxcs" {
  type = map(object({
    hostname = string
    ip       = string
  }))

  default = {
    lxc1 = { hostname = "vaultwarden", ip = "10.0.10.65" }
    lxc2 = { hostname = "dns", ip = "10.0.10.93" }
    lxc3 = { hostname = "dhcp", ip = "10.0.10.94" }
    lxc4 = { hostname = "keycloak", ip = "10.0.10.66" }
    lxc5 = { hostname = "phpipam", ip = "10.0.10.67" }
    lxc6 = { hostname = "grafana", ip = "10.0.10.68" }
    lxc7 = { hostname = "cloud", ip = "10.0.10.69" }
    lxc8 = { hostname = "openbao", ip = "10.0.10.70" }
    lxc9 = { hostname = "nginxproxymanager", ip = "10.0.10.71" }
    lxc10 = { hostname = "gns3", ip = "10.0.10.72" }
  }
}

