resource "proxmox_lxc" "base-gpu" {
  target_node  = var.target_node
  hostname     = "base-gpu"
  ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  password     = var.password
  unprivileged = true
  # template      = true
  ssh_public_keys = file(var.ssh_key_file)
  start           = true

  features {
    nesting = true
    keyctl  = true

  }

  // Terraform will crash without rootfs defined
  rootfs {
    storage = var.storage
    size    = "8G"
  }

  // NFS share mounted on host
  mountpoint {
    key    = "0"
    slot   = "0"
    volume = "/mnt/lab"
    mp     = "/mnt/lab"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}


resource "null_resource" "prepare-base-gpu" {
  depends_on = [proxmox_lxc.base-gpu]

  provisioner "local-exec" {
    command = "pwd"
  }

}


# resource "proxmox_lxc" "lmstudio" {
#   target_node = "pve"
#   pool        = "ai-lab"
#   hostname    = "lmstudio"
#   memory      = 2048
#   #id of lxc container to clone
#   clone       = "9001"
# }

# resource "proxmox_pool" "ai-lab" {
#   poolid  = "ai-lab" 
#   comment = "Example of a pool"
# }