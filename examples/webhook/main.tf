provider "github" {
  owner = "a-demo-organization"
}

module "webhook_example" {
  source = "../.."

  name       = "oh-demo-webhook-example"
  visibility = "public"

  repository_webhooks = [{
    active = true
    events = [
      "issues"
    ]

    configuration = {
      url          = "https://example.com/"
      content_type = "json"
      secret       = "AW96B6"
      insecure_ssl = false
    }
  }]
}
