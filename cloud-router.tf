resource "google_compute_router" "bgp" {
  count   = "${var.static_routes == false ? 1: 0}"
  name    = "${var.name}-vpn-bgp-router"
  network = "${var.network}"
  bgp {
    asn               = "${var.asn}"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
  }
}
