# terraform-google-network-vpn
Terraform module to create a VPN Gateway and it's tunnels

First version, only create dynamic routed (BGP) VPNs

## TO DO
* Create static routed VPNs
* Outputs
* Better docs
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| asn | Select how the routing between the network will be made. Valid options are dynamic (and it will be made via BGP) or static. | string | `` | no |
| cloud\_router | Name of cloud router previously created to use in BGP session. If not used, an ew one will be created | string | `` | no |
| local\_ranges | List of local CIDR to provide for VPN | list | `<list>` | no |
| name | VPN Gateway name | string | `VPN Gateway` | no |
| network | Name or self-link of network that will be served via VPN | string | - | yes |
| project | GCP project to be used | string | `` | no |
| region | GCP region, e.g. southamerica-east1 | string | `` | no |
| remote\_local\_ranges | List of local CIDR in the remote network to access | list | `<list>` | no |
| static\_routes | Select how the routing between the network will be made. Valid options are dynamic (and it will be made via BGP) or static. | string | `false` | no |
| tunnels | List of maps of tunnels configured into this gateway | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| gateway\_ip\_address | - |
| shared\_secret | - |