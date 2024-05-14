provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}
#-------------------------------- bucket-sun-74 -------------------------------
resource "yandex_storage_bucket" "bucket_sun_74" {
  access_key    = var.yandex_access_key
  secret_key    = var.yandex_secret_key
  acl           = "public-read"
  bucket        = "bucket-sun-74"
  force_destroy = "true"
  website {
    index_document = "index.html"
  }
}

resource "yandex_storage_object" "image-object" {
  access_key = var.yandex_access_key
  secret_key = var.yandex_secret_key
  acl        = "public-read"
  bucket     = "bucket-sun-74"
  key        = "cat.jpg"
  source     = "./cat.jpg"
  depends_on = [
    yandex_storage_bucket.bucket_sun_74,
  ]
}

#-------------- vpc_network and vpc_subnet -------------------------------
resource "yandex_vpc_network" "my_vpc" {
  name        = "my-vpc"
  description = "My VPC"
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = "public"
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

#---------------------------- instance_group -----------------------------------
resource "yandex_compute_instance_group" "testing_g" {
  name                = "testing-g"
  folder_id           = var.yandex_folder_id
  deletion_protection = false
  service_account_id  = "aje5uuc4ht8js0it0ntr"

  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size     = 4
      }
    }
    network_interface {
      subnet_ids = [yandex_vpc_subnet.public_subnet.id]
    }

    metadata = {
      user-data = file("index.yaml")
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "Целевая группа Network Load Balancer"
  }
}

#--------------------------- load_balancer --------------------------------------------
resource "yandex_lb_network_load_balancer" "load_balancer_1" {
  name = "network-load-balancer-1"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.testing_g.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}



