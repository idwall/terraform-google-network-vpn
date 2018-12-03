# For VPN gateways routing through BGP and Cloud Routers
## Create Router Interfaces
resource "google_compute_router_interface" "interface" {
  count      = "${var.static_routes == false ? length(var.tunnels) : 0}"
  project    = "${var.project}"
  name       = "${google_compute_vpn_tunnel.dynamic.*.name[count.index]}-routing-interface"
  router     = "${var.cloud_router == "" ? google_compute_router.bgp.name : var.cloud_router}"
  region     = "${var.region}"
  ip_range   = "${lookup(var.tunnels[count.index], "bgp_range")}"
  vpn_tunnel = "${google_compute_vpn_tunnel.dynamic.*.name[count.index]}"

  depends_on = [
    "google_compute_vpn_tunnel.dynamic",
  ]
}

## Create Peers
resource "google_compute_router_peer" "bgp_peer" {
  count                     = "${var.static_routes == false ? length(var.tunnels) : 0}"
  project                   = "${var.project}"
  name                      = "${google_compute_vpn_tunnel.dynamic.name}-bgp-session"
  router                    = "${var.cloud_router == "" ? google_compute_router.bgp.name : var.cloud_router}"
  region                    = "${var.region}"
  peer_ip_address           = "${lookup(var.tunnels[count.index], "bgp_peer")}"
  peer_asn                  = "${lookup(var.tunnels[count.index], "peer_bgp_asn")}"
  advertised_route_priority = "100"
  interface                 = "${google_compute_vpn_tunnel.dynamic.*.name[count.index]}-routing-interface"

  depends_on = [
    "google_compute_router_interface.interface",
  ]
}