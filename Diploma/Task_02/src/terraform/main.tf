resource "yandex_vpc_network" "my_vpc" {
  name        = "my-vpc"
  description = "My VPC"
}
resource "yandex_vpc_subnet" "my_subnet_a" {
  name           = "my-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}
resource "yandex_vpc_subnet" "my_subnet_b" {
  name           = "my-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

#------------------- master node-1 ----------------------------
resource "yandex_compute_instance" "master_node_1" {
  name                      = "master-node-1"
  hostname                  = "master-1"
  zone                      = "ru-central1-a"
  platform_id               = "standard-v1"
  allow_stopping_for_update = true
  resources {
    memory = 4
    cores  = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd8pbf0hl06ks8s3scqk"
      size     = 20
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.my_subnet_a.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = yandex_compute_instance.master_node_1.network_interface.0.nat_ip_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp -f /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys",
      "sudo chown root:root /root/.ssh/authorized_keys",
      "sudo chmod 600 /root/.ssh/authorized_keys"
    ]
  }
}

#------------------- worker nodes ----------------------------
resource "yandex_compute_instance" "worker_node_1" {
  #count       = 2
  #name        = "web-${count.index + 1}"
  #name        = "worker-node-${count.index + 1}"
  #hostname    = "worker-${count.index + 1}"
  name        = "worker-node-1"
  hostname    = "worker-1"
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
    subnet_id = yandex_vpc_subnet.my_subnet_a.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = yandex_compute_instance.worker_node_1.network_interface.0.nat_ip_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp -f /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys",
      "sudo chown root:root /root/.ssh/authorized_keys",
      "sudo chmod 600 /root/.ssh/authorized_keys"
    ]
  }

}
# ------------------------------------------------------------
resource "yandex_compute_instance" "worker_node_2" {
  #count       = 2
  #name        = "web-${count.index + 1}"
  #name        = "worker-node-${count.index + 1}"
  #hostname    = "worker-${count.index + 1}"
  name        = "worker-node-2"
  hostname    = "worker-2"
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
    subnet_id = yandex_vpc_subnet.my_subnet_a.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = yandex_compute_instance.worker_node_2.network_interface.0.nat_ip_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp -f /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys",
      "sudo chown root:root /root/.ssh/authorized_keys",
      "sudo chmod 600 /root/.ssh/authorized_keys"
    ]
  }

}


