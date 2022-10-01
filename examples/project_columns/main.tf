provider "github" {
  owner = "a-demo-organization"
}

module "project_column_example" {
  source = "../.."

  name         = "project-example"
  visibility   = "public"
  has_projects = true

  projects = [
    {
      name = "Providence Facility Infra"
      body = "Infrastructure issues for the Providence Facility"
      }, {
      name = "Providence Facility Frontend"
      body = "Frontend issues for the Providence Facility"
    }
  ]
}

resource "github_project_column" "todo" {
  count = length(module.project_column_example.project_ids)

  project_id = module.project_column_example.project_ids[count.index]
  name       = "To Do"
}

resource "github_project_column" "in_progress" {
  count = length(module.project_column_example.project_ids)

  project_id = module.project_column_example.project_ids[count.index]
  name       = "In Progress"
}

resource "github_project_column" "done" {
  count = length(module.project_column_example.project_ids)

  project_id = module.project_column_example.project_ids[count.index]
  name       = "Done"
}
