
resource "yandex_compute_instance" "platform_02" {
  depends_on = [yandex_compute_instance.platform]

  for_each   = {
    for idx, vm in var.vm_main_replica : idx => vm
  }

  name        = each.value.vm_name
  folder_id   = var.folder_id
  zone        = var.default_zone
  platform_id = var.platform_id

  resources {
    cores         = each.value.cpu
    core_fraction = var.web_core_fraction
    memory        = each.value.ram
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = each.value.disk
      type     = var.disk_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
    nat = true

  }

  metadata = {
    ssh-keys = "ubuntu:${local.pub_key}"
  }
}