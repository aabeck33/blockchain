terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.23"
    }
  }
}

provider "digitalocean" {
  token = var.blockchain_token
}

resource "digitalocean_droplet" "blockchain" {
  count  = 1
  image  = "ubuntu-22-04-x64"
  name   = "blockchain-1"
  region = "nyc3"
  size   = "gd-2vcpu-8gb"
  ssh_keys = [36625153, 36625699, 36625705]
  resize_disk = false
  tags = ["blockchain"]
}

output "ip_address" {
  value = digitalocean_droplet.blockchain[0].ipv4_address
  description = "The public IP address of the Droplet application."
}