module "mymodule" {
  source = "../../.."
  id     = random_id.id.hex
}
