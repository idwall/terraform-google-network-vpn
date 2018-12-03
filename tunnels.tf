resource "random_string" "shared_secret" {
  length           = 64
  special          = true
  number           = true
  lower            = true
  upper            = true
  override_special = "/.\" _\" "
}

#---------------- Tunnel
resource "google_compute_vpn_tunnel" "dynamic" {
  count         = "${var.static_routes == false ? length(var.tunnels) : 0}"
  name          = "${lookup(var.tunnels[count.index], "name")}"
  region        = "${var.region}"
  project       = "${var.project}"
  peer_ip       = "${lookup(var.tunnels[count.index], "peer_ip")}"
  shared_secret = "${lookup(var.tunnels[count.index], "shared_secret")}"

  target_vpn_gateway = "${google_compute_vpn_gateway.vpn_gateway.self_link}"

  router      = "${var.cloud_router == "" ? google_compute_router.bgp.name : var.cloud_router}"
  ike_version = "${lookup(var.tunnels[count.index], "ike_version")}"

  depends_on = [
    "google_compute_forwarding_rule.vpn_esp",
    "google_compute_forwarding_rule.vpn_udp500",
    "google_compute_forwarding_rule.vpn_udp4500",
  ]
}