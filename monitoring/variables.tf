variable cloud_id{
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "~/.ssh/id_rsa.pub"
}
variable subnet_id{
  description = "Subnet"
}
variable service_account_key_file{
  description = "opt/key.json"
}
variable git_sha{
 description = "git"
}
