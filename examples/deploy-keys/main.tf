module "deploy-keys-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-deploy-keys-example"
  private = false // NOTE: private repositories require a paid subscription

  deploy_keys = [
    {
      title     = "Terraform-managed deploy key"
      key       = "ssh-rsa AAA...0BSL== github@example.com"
      read_only = true
    }
  ]
}
