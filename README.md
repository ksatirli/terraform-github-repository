# Terraform Module: GitHub Repository

> Terraform Module for managing GitHub [Repositories](https://developer.github.com/v3/repos/) and associated resources.

## Table of Contents

- [Terraform Module: GitHub Repository](#terraform-module-github-repository)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.12.x` or newer.

## Dependencies

This module depends on a correctly configured [GitHub Provider](https://www.terraform.io/docs/providers/github/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "foo-cli" {
  source                                    = "github.com/withmethod/terraform-module-github-repository?ref=0.3.1"
  name                                      = "foo-cli"
  description                               = "foo CLI"
  homepage_url                              = "https://withmethod.com/open-source/"
  private                                   = true
  has_issues                                = true
  has_wiki                                  = false
  allow_merge_commit                        = false
  allow_squash_merge                        = true
  allow_rebase_merge                        = false
  has_downloads                             = false
  auto_init                                 = true
  gitignore_template                        = "Terraform"
  license_template                          = "apache-2.0"
  enable_team_repository                    = 1
  team_repository_team                      = "${github_team.internal.id}"
  team_repository_permission                = "pull"
  branch                                    = "master"
  enable_branch_protection                  = 1 // only works after initial creation of repository
  enforce_admins                            = true
  req_status_checks_strict                  = false
  req_status_checks_context                 = ["continuous-integration/travis-ci"]
  req_pr_reviews_dismiss_stale_reviews      = true
  req_pr_reviews_require_code_owner_reviews = false
  req_pr_reviews_dismissal_users            = []
  req_pr_reviews_dismissal_teams            = []
  restrictions_users                        = []
  restrictions_teams                        = []
}
```

Then, load the module using `terraform get`.

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/repository) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/operatehappy/terraform-github-repository/tree/master/examples).

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| allow_merge_commit | Set to `false` to disable merge commits on the repository | `bool` | `true` |
| allow_rebase_merge | Set to `false` to disable rebase merges on the repository | `bool` | `true` |
| allow_squash_merge | Set to `false` to disable squash merges on the repository | `bool` | `true` |
| archived | Set to `true` to mark this repository as archived | `bool` | `false` |
| auto_init | Set to `true` to produce an initial commit in the repository | `bool` | `false` |
| branch_protections | List of Branch Protection Objects | `list(any)` | `[]` |
| default_branch | The name of the default branch of the repository | `string` | `"master"` |
| deploy_keys | List of Deploy Key Objects | `list(object({ title = string, key = string, read_only = bool }))` | `[]` |
| description | A description of the repository | `string` | `""` |
| gitignore_template | Set a template to use for the `.gitignore` file | `string` | `""` |
| has_downloads | Set to `true` to enable the (deprecated) downloads features on the repository | `bool` | `false` |
| has_issues | Set to `true` to enable the Github Issues features on the repository | `bool` | `true` |
| has_projects | Set to `true` to enable the Github Projects features on the repository | `bool` | `true` |
| has_wiki | Set to `true` to enable the Github Wiki features on the repository | `bool` | `true` |
| homepage_url | URL of a page describing the project | `string` | `""` |
| issue_labels | List of Issue Label Objects | `list(object({ name = string, color = string }))` | `[]` |
| license_template | Set to a template to use for the license | `string` | `""` |
| name | The name of the repository | `string` | `""` |
| private | Set to `true` to create a private repository | `bool` | `true` |
| repository_collaborators | List of Collaborator Objects | `list(object({ username = string }))` | `[]` |
| team_repository_teams | List of Team Objects | `list(object({ team_id = string }))` | `[]` |
| template | Template repository to use to create this repository | `map(string)` | `{}` |
| topics | The list of topics of the repository | `list(string)` | `[]` |

### Outputs

| Name | Description |
|------|-------------|
| full_name | A string of the form "orgname/reponame" |
| git_clone_url | URL to clone the repository via the git protocol |
| html_url | URL to the repository on the web |
| http_clone_url | URL to clone the repository via HTTPs |
| ssh_clone_url | URL to the repository to clone via SSH |
| svn_url | URL to check out the repository via GitHub's Subversion protocol emulation |


## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-github-repositories/graphs/contributors)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
