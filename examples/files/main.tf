module "files-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-files-example"
  private = false // NOTE: private repositories require a paid subscription

  files = [
    {
      file    = "Adds .gitignore",
      content = file("file-templates/.gitignore")
      }, {
      file    = "Adds .gitattributes",
      content = file("file-templates/.gitattributes")
    }
  ]
}
