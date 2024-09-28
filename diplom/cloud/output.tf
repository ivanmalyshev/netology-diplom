output "service_account_id" {
  value = yandex_iam_service_account.terraform.id
}

output "service_account_key_id" {
  value = yandex_iam_service_account_key.terraform_key.id
}

output "service_account_key_created_at" {
  value = yandex_iam_service_account_key.terraform_key.created_at
}

output "bucket_name" {
  value = yandex_storage_bucket.imalyshev.id
}

# Выводим список сетей
output "created_subnets" {
  value = [
    for subnet in yandex_vpc_subnet.subnets :
    {
      id     = subnet.id,
      ipv4   = subnet.v4_cidr_blocks[0] # Берем первый элемент
    }
  ]
}

#Выводис список машин
output "vm_info" {
  value = [
    {
      id    = yandex_compute_instance.master_node.name
      ipv4  = yandex_compute_instance.master_node.network_interface[0].nat_ip_address
    },
    {
      id    = yandex_compute_instance.worker_node_b.name
      ipv4  = yandex_compute_instance.worker_node_b.network_interface[0].nat_ip_address
    },
    {
      id    = yandex_compute_instance.worker_node_d.name
      ipv4  = yandex_compute_instance.worker_node_d.network_interface[0].nat_ip_address
    }
  ]
}

