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

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key_sun_74.id
        sse_algorithm     = "aws:kms"
      }
    }
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

#--------------------------- kms_key ---------------------------------------
resource "yandex_kms_symmetric_key" "key_sun_74" {
  name              = "symmetric-key-sun-74"
  description       = "key for bucket"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
}

