variable "lxcs" {
  type = map(object({
    hostname = string
    ip       = string
  }))

  default = {
    lxc1 = { hostname = "web01", ip = "192.168.100.101" }
    lxc2 = { hostname = "web02", ip = "192.168.100.102" }
    lxc3 = { hostname = "web03", ip = "192.168.100.103" }
    lxc4 = { hostname = "web04", ip = "192.168.100.104" }
    lxc5 = { hostname = "web05", ip = "192.168.100.105" }
    lxc6 = { hostname = "web06", ip = "192.168.100.106" }
    lxc7 = { hostname = "web07", ip = "192.168.100.107" }
    lxc8 = { hostname = "web08", ip = "192.168.100.108" }
    lxc9 = { hostname = "web09", ip = "192.168.100.109" }
    lxc10 = { hostname = "web10", ip = "192.168.100.110" }
  }
}

