terraform {
  required_providers {
    yandex = {
      source = "github.com/yandex-cloud/yandex"
       version = "0.74.0"
    }
  }
}
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
} 
data "yandex_compute_image" "monitoring" {
  name       = "monitoring${var.git_sha}"
}
resource "yandex_compute_instance" "app" {
name = "monitoring"
hostname = "monitoring"
resources {
cores = 2
memory = 4
}
boot_disk {
initialize_params {
# Указать id образа созданного в предыдущем домашнем задании
image_id = "${data.yandex_compute_image.monitoring.id}"
}
}
network_interface {
# Указан id подсети default-ru-central1-a
subnet_id = var.subnet_id
nat = true
}
metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
}
}
