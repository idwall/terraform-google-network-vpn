# VPN Static IP
resource "google_compute_address" "vpn_gateway" {
  name   = "${var.name}-gateway-static-ip"
  region = "${var.region}"
}

resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = "${var.name}-gateway"
  network = "${var.network}"
  region  = "${var.region}"
}
