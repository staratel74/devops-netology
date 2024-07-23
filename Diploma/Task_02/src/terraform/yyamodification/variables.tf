variable "yandex_token" {}
variable "yandex_cloud_id" {}
variable "yandex_folder_id" {}
variable "yandex_access_key" {}
variable "yandex_secret_key" {}

variable "yandex_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "subnets" {
  description = "List for subnets"
  type        = list(object({
    name       = string
    zone       = string
    cidr_block = string
  }))
  default = [
    {
      name       = "my-subnet-c"
      zone       = "ru-central1-a"
      cidr_block = "10.0.3.0/24"
    },
    {
      name       = "my-subnet-d"
      zone       = "ru-central1-b"
      cidr_block = "10.0.4.0/24"
    }
  ]
}

variable "nodes" {
  description = "List for worker_node"
  type        = list(object({
    name        = string
    hostname    = string
    zone        = string
    platform_id = string
    memory      = number
    cores       = number
  }))
  default = [
    {
      name        = "worker-node-3"
      hostname    = "worker-3"
      zone        = "ru-central1-a"
      platform_id = "standard-v1"
      memory      = 2
      cores       = 2
    },
    {
      name        = "worker-node-4"
      hostname    = "worker-4"
      zone        = "ru-central1-a"
      platform_id = "standard-v1"
      memory      = 2
      cores       = 2
    },
    {
      name        = "worker-node-5"
      hostname    = "worker-5"
      zone        = "ru-central1-a"
      platform_id = "standard-v1"
      memory      = 2
      cores       = 2
    }
  ]
}