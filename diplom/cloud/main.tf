
resource "yandex_iam_service_account" "terraform" {
  name        = "terraform"
  description = "Service account for Terraform"
}

resource "yandex_iam_service_account_key" "terraform_key" {
  service_account_id = yandex_iam_service_account.terraform.id
}

output "service_account_id" {
  value = yandex_iam_service_account.terraform.id
}

output "service_account_key_id" {
  value = yandex_iam_service_account_key.terraform_key.id
}

output "service_account_key_created_at" {
  value = yandex_iam_service_account_key.terraform_key.created_at
}