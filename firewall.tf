# External Rules
resource "google_compute_forwarding_rule" "vpn_esp" {
  name        = "${google_compute_vpn_gateway.vpn_gateway.name}-esp"
  region      = "${var.region}"
  ip_protocol = "ESP"
  ip_address  = "${google_compute_address.vpn_gateway.address}"
  target      = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "vpn_udp500" {
  name        = "${google_compute_vpn_gateway.vpn_gateway.name}-udp500"
  region      = "${var.region}"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = "${google_compute_address.vpn_gateway.address}"
  target      = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "vpn_udp4500" {
  name        = "${google_compute_vpn_gateway.vpn_gateway.name}-udp4500"
  region      = "${var.region}"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = "${google_compute_address.vpn_gateway.address}"
  target      = "${google_compute_vpn_gateway.vpn_gateway.self_link}"
}