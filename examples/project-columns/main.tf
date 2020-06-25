module "project_column_example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-project-example"
  private = false

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
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "To Do"
}

resource "github_project_column" "in-progress" {
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "In Progress"
}

resource "github_project_column" "done" {
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "Done"
}
