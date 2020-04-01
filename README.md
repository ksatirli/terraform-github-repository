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
  - [Notes](#notes)
    - [github_repository resources](#for-github-repository-resources)
    - [github_repository_deploy_key resource](#for-github-repository-deploy-key-resources)
    - [github_branch_protection resources](#for-github-branch-protection-resources)
    - [github_repository_project resources](#for-github-repository-project-resources)
    - [github_repository_file resources](#for-github-repository-file-resources)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.12.x` or newer.

## Dependencies

This module depends on a correctly configured [GitHub Provider](https://www.terraform.io/docs/providers/github/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "simple-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-simple-example"
  private = false // NOTE: private repositories require a paid subscription
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/repository/github) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/operatehappy/terraform-github-repository/tree/master/examples).

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| allow_merge_commit | Toggle to enable Merge Commits for the Repository | `bool` | `true` |
| allow_rebase_merge | Toggle to enable Rebase Merges for the Repository | `bool` | `true` |
| allow_squash_merge | Toggle to enable Squash Merges for the Repository | `bool` | `true` |
| archived | Toggle to archive the Repository (see notes in `README.md`) | `bool` | `false` |
| auto_init | Toggle to create an initial commit in the Repository | `bool` | `false` |
| branch_protections | List of Branch Protection Objects | <pre>list(object({<br>    branch                 = string,<br>    enforce_admins         = bool,<br>    require_signed_commits = bool,<br>    required_status_checks = object({<br>      strict = bool<br>      contexts = list(string)<br>    })<br><br>    required_pull_request_reviews = object({<br>      dismiss_stale_reviews           = bool,<br>      dismissal_users                 = list(string),<br>      dismissal_teams                 = list(string),<br>      require_code_owner_reviews      = bool,<br>      required_approving_review_count = number // NOTE: this can be at most 6<br>    })<br><br>    restrictions = object({<br>      users = list(string),<br>      teams = list(string)<br>    })<br>  }))</pre> | `[]` |
| default_branch | Name of the Default Branch of the Repository | `string` | `"master"` |
| deploy_keys | List of Deploy Key Objects | <pre>list(object({<br>    title     = string,<br>    key       = string,<br>    read_only = bool<br>  }))</pre> | `[]` |
| description | Description of the Repository | `string` | `""` |
| files | List of File Objecs | <pre>list(object({<br>    file    = string,<br>    content = string<br>  }))</pre> | `[]` |
| gitignore_template | Template to use for initial `.gitignore` file for the Repository | `string` | `""` |
| has_downloads | Toggle to enable (deprecated) GitHub Downloads for the Repository | `bool` | `false` |
| has_issues | Toggle to enable GitHub Issues for the Repository | `bool` | `true` |
| has_projects | Toggle to enable GitHub Projects for the Repository | `bool` | `false` |
| has_wiki | Toggle to enable GitHub Wiki for the Repository | `bool` | `true` |
| homepage_url | URL of a page describing the Repository | `string` | `""` |
| issue_labels | List of Issue Label Objects | <pre>list(object({<br>    name  = string,<br>    color = string<br>  }))</pre> | `[]` |
| license_template | Identifier to use for initial `LICENSE` file for the Repository | `string` | `""` |
| name | Name of the Repository | `string` | `""` |
| private | Toggle to create a Private Repository | `bool` | `true` |
| projects | List of Project Objecs | <pre>list(object({<br>    name = string,<br>    body = string<br>  }))</pre> | `[]` |
| repository_collaborators | List of Collaborator Objects | <pre>list(object({<br>    username = string<br>  }))</pre> | `[]` |
| team_repository_teams | List of Team Repository Team Objects | <pre>list(object({<br>    team_id = string<br>  }))</pre> | `[]` |
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
| files | Map of Repository File names and corresponding SHA blobs |
| projects | Map of Repository Project names and corresponding URLs |
| project_ids | List of Repository Project IDs |
| project_urls | List of Repository Project IDs |

## Notes

### For `github_repository` resources

- Resources that are created with the `template` option enabled will be re-created (that is: _destroyed_, then created again) when the `template` stub is removed

- Resources that are archived using the `archive` option cannot be unarchived, as the GitHub API does not currently support this

### For `github_repository_deploy_key` resources

- Deploy Key resources expect a string for the `deploy_key.key` variable. Use the [file](https://www.terraform.io/docs/configuration/functions/file.html) function if key material is not available as a Terraform-variable already

- For a step-by-step guide on how to generate SSH Keys, see [this article](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) on GitHub

### For `github_branch_protection` resources

- Branch Protection resources that set the [required_approving_review_count](https://www.terraform.io/docs/providers/github/r/branch_protection.html#required_approving_review_count) variable must be in a range of `>= 1` and `<= 6`

### For `github_repository_project` resources

- Project resources require GitHub Projects to be enabled for the Organization as well as the `has_projects` variable set to `true`

### For `github_repository_file` resources

- File resources require an (already existing) `master` branch  or an explicitly defined branch for the `files.branch` variable to avoid errors

- File resources expect a string for the `files.content` variable. Use the [file](https://www.terraform.io/docs/configuration/functions/file.html) function if file data is not available as a Terraform-variable already

- File resources that are removed from Terraform will _also_ be removed from the Repository. This is visible in the Repository History

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-github-repositories/graphs/contributors).

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
