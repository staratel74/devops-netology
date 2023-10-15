resource "yandex_compute_disk" "disk_01" {
  count = 3
  name  = "empty-${count.index + 1}"
  type  = var.disk_type
  zone  = var.default_zone
  size  = 1
}

resource "yandex_compute_instance" "vm_storage" {
  depends_on = [yandex_compute_disk.disk_01]

  name        = var.storage_name
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

  dynamic secondary_disk {

    for_each = yandex_compute_disk.disk_01
    content {
      disk_id = secondary_disk.value.id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat = true

  }

  metadata = {
    ssh-keys = "ubuntu:${local.pub_key}"
  }
}

