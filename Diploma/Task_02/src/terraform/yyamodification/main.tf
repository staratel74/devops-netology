# убрат код
provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}
# убрат код



resource "yandex_vpc_network" "my_vpc" {
  name        = "my-vpc"
  description = "My VPC"
}

resource "yandex_vpc_subnet" "my_subnets" {
  count          = length(var.subnets)
  name           = var.subnets[count.index].name
  zone           = var.subnets[count.index].zone
  v4_cidr_blocks = [var.subnets[count.index].cidr_block]
  network_id     = yandex_vpc_network.my_vpc.id
}

#------------------- nodes ----------------------------
resource "yandex_compute_instance" "nodes" {
  count       = length(var.nodes)
  name        = var.nodes[count.index].name
  hostname    = var.nodes[count.index].hostname
  zone        = var.nodes[count.index].zone
  platform_id = var.nodes[count.index].platform_id

  resources {
    memory = var.nodes[count.index].memory
    cores  = var.nodes[count.index].cores
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pbf0hl06ks8s3scqk"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.my_subnets[0].id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
