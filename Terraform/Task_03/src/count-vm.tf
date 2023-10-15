data "yandex_compute_image" "ubuntu" {
  family = var.web_family #"ubuntu-2004-lts"
}
output "data_yandex_compute_image" {
  value = data.yandex_compute_image.ubuntu.name
}

resource "yandex_compute_instance" "platform" {
  count = 2

  name        = "web-${count.index + 1}"
  folder_id   = var.folder_id
  zone        = var.default_zone
  platform_id = var.platform_id


  resources {
    cores         = var.web_core
    core_fraction = var.web_core_fraction
    memory        = var.web_memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.disk_size
      type     = var.disk_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true

  }

  metadata = {
    ssh-keys = "ubuntu:${local.pub_key}"
  }
}


