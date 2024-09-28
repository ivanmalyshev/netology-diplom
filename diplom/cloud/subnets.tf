locals {
  subnets = [
    {
      name = "k8s-subnet-a"
      zone = "ru-central1-a"
      cidr = "10.0.0.0/24"
    },
    {
      name = "k8s-subnet-b"
      zone = "ru-central1-b"
      cidr = "10.0.1.0/24"
    },
    {
      name = "k8s-subnet-d"
      zone = "ru-central1-d"
      cidr = "10.0.2.0/24"
    }
  ]
}

# Создание сети VPC
resource "yandex_vpc_network" "k8s_vpc" {
  name = "k8s-vpc"
}

# Создание подсетей в разных зонах доступности
resource "yandex_vpc_subnet" "subnets" {
  for_each = { for subnet in local.subnets : subnet.name => subnet }

  name           = each.value.name
  zone           = each.value.zone
  network_id     = yandex_vpc_network.k8s_vpc.id
  v4_cidr_blocks = [each.value.cidr]
}
