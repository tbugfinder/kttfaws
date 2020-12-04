locals {
  name           = "testvpn"
  cgw_ip_address = "12.18.${local.cgw_ip_octet_3}.${local.cgw_ip_octet_4}"

  tags = {
    Name = "${local.name}-${local.id}"
  }
}

###############################################
# Create Resources needed for Test Fixture    #
###############################################
resource "aws_ec2_transit_gateway" "this" {
  # auto_accept_shared_attachments = "enable"

  tags = {
    Name = "${local.name}-tgw-${local.id}"
  }
}


### MODULE in test
module "testvpn" {
  source = "../../.."
  id     = random_id.id.hex
  name = local.name
  tags = local.tags

  bgp_asn    = local.cgw_bgp_asn
  ip_address = local.cgw_ip_address
  vpn_type   = "ipsec.1"

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  static_routes_only = true

  destination_cidr_blocks = ["172.16.1.0/25", "172.16.2.0/23", "192.168.22.0/24"]
}
