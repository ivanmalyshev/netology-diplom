# ВМ для мастера Kubernetes
resource "yandex_compute_instance" "master_node" {
  name        = "k8s-master"
  zone        = "ru-central1-a"
  platform_id = "standard-v2"  # Минимальная ВМ для мастера
  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id # Ubuntu или другая ОС
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnets["k8s-subnet-a"].id
    nat       = true
  }
}

# Прерываемые ВМ для worker узлов
resource "yandex_compute_instance" "worker_node_b" {
  name        = "k8s-worker-b"
  zone        = "ru-central1-b"
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 4
  }

  scheduling_policy {
    preemptible = true # Прерываемая ВМ для экономии
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id # Ubuntu или другая ОС
      size     = 30
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnets["k8s-subnet-b"].id
    nat       = true
  }
}

resource "yandex_compute_instance" "worker_node_d" {
  name        = "k8s-worker-d"
  zone        = "ru-central1-d"
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 4
  }

  scheduling_policy {
    preemptible = true # Прерываемая ВМ
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id # Ubuntu или другая ОС
      size     = 30
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnets["k8s-subnet-d"].id
    nat       = true
  }
}
