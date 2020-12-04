provider "random" {
}

resource "random_id" "id" {
  byte_length = 6
}

resource "random_integer" "random_ip_octet_3" {
  min = 1
  max = 254
}

resource "random_integer" "random_ip_octet_4" {
  min = 1
  max = 254
}

resource "random_integer" "random_bgp_asn" {
  min = 64512
  max = 65534
}

locals {
  id             = random_id.id.hex
  cgw_ip_octet_3 = random_integer.random_ip_octet_3.result
  cgw_ip_octet_4 = random_integer.random_ip_octet_4.result
  cgw_bgp_asn    = random_integer.random_bgp_asn.result
}
