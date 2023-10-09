###cloud vars

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "enpjqqs8u1uvb6jr54bu"
  description = "VPC network & subnet name"
}


###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMhsDdw7lk11PDk1i0An61OIyIsXBHjIAT0IWJw3M5fu root@serv10"
  description = "ssh-keygen -t ed25519"
}
*/
################## my new variables ######################
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
}

/*
variable "vm_web_core" {
  type        = number
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  default     = 1
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
}

variable "vm_web_serial-port-enable" {
  type        = number
  default     = 1
}
/*
###### for vm_web_resources #######################
variable "vm_web_resources"   {
  type    = map(string)
  default = {
    core = "2"
    memory = "1"
    core_fraction = "20"
  }
}

########## for vm_db_resources ####################
variable "vm_db_resources"   {
  type    = map(string)
  default = {
    core = "2"
    memory = "2"
    core_fraction = "20"
  }
}
*/
########## for vms_resources ####################
variable "vms_resources" {
  default = {
    vm_web_resources = {
      core      = "2"
      memory   = "1"
      core_fraction = "20"
    }
    vm_db_resources = {
      core      = "2"
      memory   = "2"
      core_fraction = "20"
    }
  }
}

########## for metadata_all ##########################
variable "metadata_all"   {
  type    = map(string)
  default = {
    serial-port-enable = "1" #core = "2"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMhsDdw7lk11PDk1i0An61OIyIsXBHjIAT0IWJw3M5fu root@serv10" #memory = "2"
  }
}



variable "develop" {
  type        = string
  default = "develop"
}
variable "platform" {
  type        = string
  default ="platform"
}
variable "web" {
  type        = string
  default = "web"
}
variable "db" {
  type        = string
  default = "db"
}




