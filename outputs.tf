output "gateway_ip_address" {
  value = "${google_compute_address.vpn_gateway.address}"
}

output "shared_secret" {
  value = "${random_string.shared_secret.result}"

  # sensitive = true
}
