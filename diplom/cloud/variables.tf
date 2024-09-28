variable "yandex_token" {
  description = "Yandex.Cloud OAuth token"
  type        = string
}

variable "yandex_cloud_id" {
  description = "Yandex.Cloud ID"
  type        = string
}

variable "yandex_folder_id" {
  description = "Yandex.Cloud Folder ID"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "image_id" {
  description = "image_id for VMs"
  type = string
}