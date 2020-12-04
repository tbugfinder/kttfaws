output "vpn" {
  description = "Outputs of the VPN resource."
  value       = aws_vpn_connection.this.*
}
