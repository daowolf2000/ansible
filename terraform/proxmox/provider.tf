terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  # pm_log_enable = true
  # pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug = true

}

