resource "proxmox_lxc" "basic" {
  target_node   = var.target_node
  hostname      = "lxc-basic"
  ostemplate    = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  password      = var.password
  unprivileged  = true
  template      = true
  ssh_public_keys = file(var.ssh_key_file)


  // Terraform will crash without rootfs defined
  rootfs {
    storage = var.storage
    size    = "8G"
  }


  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

resource "proxmox_lxc" "lmstudio" {
  target_node = "pve"
  pool        = "example-pool"
  hostname    = "lmstudio"
  memory      = 2048
  #id of lxc container to clone
  clone       = "100"
}

resource "proxmox_pool" "example" {
  poolid  = "example-pool" 
  comment = "Example of a pool"
}