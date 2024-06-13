locals {
  vm_name = var.vm_name != null ? var.vm_name : "vm${local.regions_prefixes}${local.enviromenet_index}"

  enviromenet_index = substr(local.enviromenet_prefix, 0, 1)

  enviromenet_prefix = lookup(
    {
      production  = "prd",
      development = "dev",
      test        = "tst"
    }
  , var.environement)

  regions_prefixes = lookup(
    {
      "global"      = "glob"
      "centralus"   = "cus1"
      "eastus"      = "eus1"
      "eastus2"     = "eus2"
      "westeurope"  = "weu1"
      "northeurope" = "neu1"
    }
  , var.location)
}