provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}

resource "yandex_vpc_network" "my_vpc" {
  name        = "my-vpc"
  description = "My VPC"
}
resource "yandex_vpc_route_table" "my_route_table" {
  network_id = yandex_vpc_network.my_vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}
resource "yandex_vpc_subnet" "public_subnet" {
  name           = "public"
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "private_subnet" {
  name           = "private"
  network_id     = yandex_vpc_network.my_vpc.id
  route_table_id = yandex_vpc_route_table.my_route_table.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}
#------------------- nat_instance ----------------------------
resource "yandex_compute_instance" "nat_instance" {
  name        = "nat-instance"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"
  resources {
    memory = 2
    cores  = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.public_subnet.id
    ip_address = "192.168.10.254"
    nat        = true
  }
}

#------------------- public_vm ----------------------------
resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
  hostname    = "public-vm-01"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"
  resources {
    memory = 2
    cores  = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pbf0hl06ks8s3scqk"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
#------------------- private_vm ----------------------------
resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  hostname    = "private-vm-01"
  zone        = "ru-central1-a"
  platform_id = "standard-v1"
  resources {
    memory = 2
    cores  = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pbf0hl06ks8s3scqk"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

