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
| allow_merge_commit | Toggle to enable Merge Commits for the Repository | `bool` | `true` |
| allow_rebase_merge | Toggle to enable Rebase Merges for the Repository | `bool` | `true` |
| allow_squash_merge | Toggle to enable Squash Merges for the Repository | `bool` | `true` |
| archived | Toggle to archive the Repository (see notes in `README.md`) | `bool` | `false` |
| auto_init | Toggle to create an initial commit in the Repository | `bool` | `false` |
| branch_protections | List of Branch Protection Objects | `list(any)` | `[]` |
| default_branch | Name of the Default Branch of the Repository | `string` | `"master"` |
| deploy_keys | List of Deploy Key Objects | `list(object({ title = string, key = string, read_only = bool }))` | `[]` |
| description | Description of the Repository | `string` | `""` |
| gitignore_template | Template to use for initial `.gitignore` file for the Repository | `string` | `""` |
| has_downloads | Toggle to enable (deprecated) GitHub Downloads for the Repository | `bool` | `false` |
| has_issues | Toggle to enable GitHub Issues for the Repository | `bool` | `true` |
| has_projects | Toggle to enable GitHub Projects for the Repository | `bool` | `true` |
| has_wiki | Toggle to enable GitHub Wiki for the Repository | `bool` | `true` |
| homepage_url | URL of a page describing the Repository | `string` | `""` |
| issue_labels | List of Issue Label Objects | `list(object({ name = string, color = string }))` | `[]` |
| license_template | Identifier to use for initial `LICENSE` file for the Repository | `string` | `""` |
| name | Name of the Repository | `string` | `""` |
| private | Toggle to create a Private Repository | `bool` | `true` |
| repository_collaborators | List of Collaborator Objects | `list(object({ username = string }))` | `[]` |
| team_repository_teams | List of Team Repository Team Objects | `list(object({ team_id = string }))` | `[]` |
| template | Template Repository to use when creating the Repository | `map(string)` | `{}` |
| topics | List of Topics of the Repository | `list(string)` | `[]` |

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
