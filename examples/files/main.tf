module "files_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

  name       = "oh-demo-files-example"
  visibility = "public"

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
