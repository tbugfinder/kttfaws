variable "id" {
  description = "random string"
  type        = string
}

variable "name" {
  description = "The name of the blueprint."
  type        = string
}

variable "bgp_asn" {
  description = "BGP ASN number"
  type        = string
}

variable "ip_address" {
  description = "IP Address of Customer Gateway"
  type        = string
}

variable "vpn_type" {
  default     = "ipsec.1"
  description = "The type of VPN Connection"
  type        = string
}

variable "transit_gateway_id" {
  description = "The Transit Gateway ID"
  type        = string
}

variable "destination_cidr_blocks" {
  description = "List of CIDRs for static routes."
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "A map of tag key-value pairs."
  type        = map(string)
}

variable "static_routes_only" {
  default     = "true"
  description = "Static Routes enabled"
  type        = string
}

