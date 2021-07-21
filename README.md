# Terraform Module: GitHub Repository

> Terraform Module for managing GitHub [Repositories](https://developer.github.com/v3/repos/) and associated resources.

## Table of Contents

- [Terraform Module: GitHub Repository](#terraform-module-github-repository)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Notes](#notes)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.14.0` or newer.

## Dependencies

This module depends on a correctly configured [GitHub Provider](https://www.terraform.io/docs/providers/github/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "simple_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

  name       = "oh-demo-simple-example"
  visibility = false
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/repository/github) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/operatehappy/terraform-github-repository/tree/main/examples).

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| allow_merge_commit | Toggle to enable Merge Commits for the Repository | `bool` | `true` |
| allow_rebase_merge | Toggle to enable Rebase Merges for the Repository | `bool` | `true` |
| allow_squash_merge | Toggle to enable Squash Merges for the Repository | `bool` | `true` |
| archive_on_destroy | Toggle to archive the Repository on destroy | `bool` | `false` |
| archived | Toggle to archive the Repository (see notes in `README.md`) | `bool` | `false` |
| auto_init | Toggle to create an initial commit in the Repository | `bool` | `false` |
| branch_protections | List of Branch Protection Objects | <pre>list(object({<br>    branch                 = string,<br>    enforce_admins         = bool,<br>    require_signed_commits = bool,<br>    required_status_checks = object({<br>      strict   = bool<br>      contexts = list(string)<br>    })<br><br>    required_pull_request_reviews = object({<br>      dismiss_stale_reviews           = bool,<br>      dismissal_users                 = list(string),<br>      dismissal_teams                 = list(string),<br>      require_code_owner_reviews      = bool,<br>      required_approving_review_count = number // NOTE: this must be 6 or less<br>    })<br><br>    restrictions = object({<br>      users = list(string),<br>      teams = list(string)<br>    })<br>  }))</pre> | `[]` |
| default_branch | Name of the Default Branch of the Repository | `string` | `"main"` |
| delete_branch_on_merge | Toggle to automatically delete merged Branches for the Repository | `bool` | `false` |
| deploy_keys | List of Deploy Key Objects | <pre>list(object({<br>    title     = string,<br>    key       = string,<br>    read_only = bool<br>  }))</pre> | `[]` |
| description | Description of the Repository | `string` | `""` |
| files | List of File Objecs | <pre>list(object({<br>    file    = string,<br>    content = string<br>  }))</pre> | `[]` |
| gitignore_template | Template to use for initial `.gitignore` file for the Repository | `string` | `""` |
| has_downloads | Toggle to enable (deprecated) GitHub Downloads for the Repository | `bool` | `false` |
| has_issues | Toggle to enable GitHub Issues for the Repository | `bool` | `true` |
| has_projects | Toggle to enable GitHub Projects for the Repository | `bool` | `false` |
| has_wiki | Toggle to enable GitHub Wiki for the Repository | `bool` | `true` |
| homepage_url | URL of a page describing the Repository | `string` | `""` |
| is_template | Toggle to enable Template use for the Repository | `bool` | `false` |
| issue_labels | List of Issue Label Objects | <pre>list(object({<br>    name  = string,<br>    color = string<br>  }))</pre> | `[]` |
| license_template | Identifier to use for initial `LICENSE` file for the Repository | `string` | `""` |
| name | Name of the Repository | `string` | `""` |
| pages | Configuration block for GitHub Pages | `map(any)` | `{}` |
| projects | List of Project Objecs | <pre>list(object({<br>    name = string,<br>    body = string<br>  }))</pre> | `[]` |
| repository_collaborators | List of Collaborator Objects | <pre>list(object({<br>    username = string<br>  }))</pre> | `[]` |
| team_repository_teams | List of Team Repository Team Objects | <pre>list(object({<br>    team_id = string,<br>    permission = string<br>  }))</pre> | `[]` |
| template | Template Repository to use when creating the Repository | `map(string)` | `{}` |
| topics | List of Topics of the Repository | `list(string)` | `[]` |
| visibility | Toggle to create a Private Repository | `string` | `"private"` |
| vulnerability_alerts | Toggle to enable Vulnerability Alerts for the Repository | `bool` | `true` |

### Outputs

| Name | Description |
|------|-------------|
| files | Map of Repository File names and corresponding SHA blobs |
| full_name | A string of the form "orgname/reponame" |
| git_clone_url | URL to clone the repository via the git protocol |
| html_url | URL to the repository on the web |
| http_clone_url | URL to clone the repository via HTTPs |
| name | A string of the form "reponame" |
| node_id | Node ID of the Repository |
| project_ids | List of Repository Project IDs |
| project_urls | List of Repository Project IDs |
| projects | Map of Repository Project IDs, and corresponding URLs |
| repo_id | ID of the Repository |
| ssh_clone_url | URL to the repository to clone via SSH |
| svn_url | URL to check out the repository via GitHub's Subversion protocol emulation |

## Notes

### Upgrading from `2.0.0` to `3.x.x`

The `3.0.0` version of this module introduced support for the [github_branch_default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) resource, a property that was initially handled through the `github_repository` resource.

For a better upgrade experience, it is advised to manually import this resource, using the [import](https://www.terraform.io/docs/cli/import/index.html) command:

```sh
terraform import module.my_repository.github_branch_default.this "my_repository"
```

Replace `module.my_repository` with the Module identifier in use and replace `"my_repository"` with the name of the repository the data is imported from.

### For `github_repository` resources

- Resources that are created with the `template` option enabled will be re-created (that is: _destroyed_, then created again) when the `template` stub is removed

- Resources that are archived using the `archive` option cannot be unarchived, as the GitHub API does not currently support this

- Starting with `3.0.0` of this Module, the default branch option is no longer set through the `github_repository` resource

### For `github_repository_deploy_key` resources

- Deploy Key resources expect a string for the `deploy_key.key` variable. Use the [file](https://www.terraform.io/docs/configuration/functions/file.html) function if key material is not available as a Terraform-variable already

- For a step-by-step guide on how to generate SSH Keys, see [this article](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) on GitHub

### For `github_branch_protection` resources

- Branch Protection resources that set the [required_approving_review_count](https://www.terraform.io/docs/providers/github/r/branch_protection.html#required_approving_review_count) variable must be in a range of `>= 1` and `<= 6`

### For `github_repository_project` resources

- Project resources require GitHub Projects to be enabled for the Organization as well as the `has_projects` variable set to `true`

### For `github_repository_file` resources

- File resources require an (already existing) `main` branch, or an explicitly defined branch for the `files.branch` variable to avoid errors

- File resources expect a string for the `files.content` variable. Use the [file](https://www.terraform.io/docs/configuration/functions/file.html) function if file data is not available as a Terraform-variable already

- File resources that are removed from Terraform will _also_ be removed from the Repository. This is visible in the Repository History

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-github-repository/graphs/contributors).

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
