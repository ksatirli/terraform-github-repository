provider "github" {
  owner = "a-demo-organization"
}

module "files_example" {
  source = "../.."

  name       = "files-example"
  auto_init  = true
  visibility = "public"

  files = [
    {
      file    = ".gitignore",
      content = file("../../.gitignore")
      }, {
      file    = "LICENSE",
      content = file("../../LICENSE")
    }
  ]
}
