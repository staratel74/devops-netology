provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.yandex_zone
}
#-------------------------------- terraform_state_bucket_sun_74 -------------------------------
resource "yandex_storage_bucket" "terraform_state_bucket_sun_74" {
  access_key    = var.yandex_access_key
  secret_key    = var.yandex_secret_key
  bucket        = "terraform-state-bucket-sun-74"
  acl           = "private"
  force_destroy = "true"
}
