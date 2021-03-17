output "tags" {
  value = {
    created-by  = "Terraform"
    create-date = formatdate("YYYY-MM-DD", timestamp())
  }
}