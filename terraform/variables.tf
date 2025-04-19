#тут вписываем свой ssh ключ
variable "ssh_key_file" {
  description = "My SSH public key"
  type        = string
}

variable "password" {
  description = "My password for enviroment"
  type        = string
}

variable "storage" {
  description = "Storage for VMs"
  type        = string
  default     = "local-lvm"
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
  default     = "pve"
}

