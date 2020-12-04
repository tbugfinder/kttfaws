#
# 
#

# Transit Gateway is created by a different module

data "aws_ec2_transit_gateway_vpn_attachment" "this" {
  transit_gateway_id = var.transit_gateway_id
  vpn_connection_id  = aws_vpn_connection.this.id
}


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway_route_table
data "aws_ec2_transit_gateway_route_table" "this" {
  filter {
    name   = "default-association-route-table"
    values = ["true"]
  }

  filter {
    name   = "transit-gateway-id"
    values = [var.transit_gateway_id]
  }
}


resource "aws_customer_gateway" "this" {
  bgp_asn    = var.bgp_asn
  ip_address = var.ip_address
  type       = var.vpn_type
}


resource "aws_vpn_connection" "this" {
  customer_gateway_id = aws_customer_gateway.this.id
  transit_gateway_id  = var.transit_gateway_id
  type                = var.vpn_type
  static_routes_only  = var.static_routes_only
}


resource "aws_ec2_transit_gateway_route" "this" {
  count                          = var.static_routes_only && length(var.destination_cidr_blocks) > 0 ? length(var.destination_cidr_blocks) : 0
  destination_cidr_block         = element(var.destination_cidr_blocks, count.index)
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.this.id
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.this.id
  #transit_gateway_route_table_id = "tgw-rtbl-11233322"
}
