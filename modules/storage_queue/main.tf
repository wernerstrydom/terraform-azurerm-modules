resource "azurerm_storage_queue" "this" {
  metadata           = var.metadata
  name               = var.name
  storage_account_id = var.storage_account_id

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}
