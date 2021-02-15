module "project_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

  name       = "oh-demo-project-example"
  visibility = "public"

  projects = [
    {
      name = "Internal Infrastructure"
      body = "Internal Infrastructure Project for Section 13"
    }
  ]
}
