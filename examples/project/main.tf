provider "github" {
  owner = "a-demo-organization"
}

module "project_example" {
  source = "../.."

  name         = "oh-demo-project-example"
  visibility   = "public"
  has_projects = true

  projects = [
    {
      name = "Internal Infrastructure"
      body = "Internal Infrastructure Project for Section 13"
    }
  ]
}
