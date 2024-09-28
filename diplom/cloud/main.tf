
resource "yandex_iam_service_account" "terraform" {
  name        = "terraform"
  description = "Service account for Terraform"
}

resource "yandex_iam_service_account_key" "terraform_key" {
  service_account_id = yandex_iam_service_account.terraform.id
}

