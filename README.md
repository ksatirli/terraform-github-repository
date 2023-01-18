# GitHub Repository

> This Terraform Module manages the lifecycle of GitHub Repositories and associated resources.

## Table of Contents

<!-- TOC -->
* [GitHub Repository](#github-repository)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Dependencies](#dependencies)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* GitHub [Account](https://github.com/join)
* Terraform `1.0.x` or newer.

## Dependencies

This module depends on a correctly configured [GitHub Provider](https://www.terraform.io/docs/providers/github/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "simple_example" {
  source  = "ksatirli/repository/github"
  version = "4.0.0"

  name       = "simple-example"
  visibility = false
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/ksatirli/repository/github) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/ksatirli/terraform-github-repository/tree/main/examples).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the Repository. | `string` | n/a | yes |
| allow_auto_merge | Toggle to enable auto-merging pull requests on the repository. | `bool` | `false` | no |
| allow_merge_commit | Toggle to enable Merge Commits for the Repository. | `bool` | `true` | no |
| allow_rebase_merge | Toggle to enable Rebase Merges for the Repository. | `bool` | `true` | no |
| allow_squash_merge | Toggle to enable Squash Merges for the Repository. | `bool` | `true` | no |
| archive_on_destroy | Toggle to archive the Repository on destroy. | `bool` | `false` | no |
| archived | Toggle to archive the Repository (see notes in `README.md`). | `bool` | `false` | no |
| auto_init | Toggle to create an initial commit in the Repository. | `bool` | `false` | no |
| branch_protections | List of Branch Protection Objects. | <pre>list(object({<br>    branch                 = string,<br>    enforce_admins         = bool,<br>    require_signed_commits = bool,<br>    required_status_checks = object({<br>      strict   = bool<br>      contexts = list(string)<br>    })<br><br>    required_pull_request_reviews = object({<br>      dismiss_stale_reviews           = bool,<br>      dismissal_users                 = list(string),<br>      dismissal_teams                 = list(string),<br>      require_code_owner_reviews      = bool,<br>      required_approving_review_count = number<br>    })<br><br>    restrictions = object({<br>      users = list(string),<br>      teams = list(string)<br>    })<br>  }))</pre> | `null` | no |
| default_branch | Name of the Default Branch of the Repository. | `string` | `"main"` | no |
| delete_branch_on_merge | Toggle to automatically delete merged Branches for the Repository. | `bool` | `false` | no |
| deploy_keys | List of Deploy Key Objects | <pre>list(object({<br>    title     = string,<br>    key       = string,<br>    read_only = bool<br>  }))</pre> | `[]` | no |
| description | Description of the Repository. | `string` | `null` | no |
| files | List of File Objects. | <pre>list(object({<br>    file                = string,<br>    content             = string,<br>    overwrite_on_create = string<br>  }))</pre> | `[]` | no |
| gitignore_template | Template to use for initial `.gitignore` file for the Repository. | `string` | `null` | no |
| has_downloads | Toggle to enable (deprecated) GitHub Downloads for the Repository. | `bool` | `false` | no |
| has_issues | Toggle to enable GitHub Issues for the Repository. | `bool` | `true` | no |
| has_projects | Toggle to enable GitHub Projects for the Repository. | `bool` | `false` | no |
| has_wiki | Toggle to enable GitHub Wiki for the Repository. | `bool` | `false` | no |
| homepage_url | URL of a page describing the Repository. | `string` | `null` | no |
| is_template | Toggle to enable Template use for the Repository. | `bool` | `false` | no |
| issue_labels | List of Issue Label Objects. | <pre>list(object({<br>    name  = string,<br>    color = string<br>  }))</pre> | `[]` | no |
| license_template | Identifier to use for initial `LICENSE` file for the Repository. | `string` | `null` | no |
| pages | Configuration block for GitHub Pages. | `map(any)` | `{}` | no |
| pages_branch | Name of the GitHub Pages Branch of the Repository. | `string` | `"gh-pages"` | no |
| projects | List of Project Objects. | <pre>list(object({<br>    name = string,<br>    body = string<br>  }))</pre> | `[]` | no |
| repository_collaborators | List of Collaborator Objects. | <pre>list(object({<br>    username = string<br>  }))</pre> | `[]` | no |
| repository_webhooks | A list of events which should trigger the webhook. | <pre>list(object({<br>    active = bool<br>    events = list(string)<br><br>    configuration = object({<br>      url          = string<br>      content_type = string<br>      secret       = string<br>      insecure_ssl = bool<br>    })<br>  }))</pre> | `[]` | no |
| team_repository_teams | List of Team Repository Team Objects. | <pre>list(object({<br>    team_id    = string<br>    permission = string<br>  }))</pre> | `[]` | no |
| template | Template Repository to use when creating the Repository. | `map(string)` | `{}` | no |
| topics | List of Topics of the Repository. | `list(string)` | `null` | no |
| visibility | Toggle to set the visibility of the Repository. | `string` | `"private"` | no |
| vulnerability_alerts | Toggle to enable Vulnerability Alerts for the Repository. | `bool` | `true` | no |

### Outputs

| Name | Description |
|------|-------------|
| github_issue_label | Exported Attributes for `github_issue_label`. |
| github_repository | Exported Attributes for `github_repository`. |
| github_repository_collaborator | Exported Attributes for `github_repository_collaborator`. |
| github_repository_deploy_key | Exported Attributes for `github_repository_deploy_key`. |
| github_repository_file | Exported Attributes for `github_repository_file`. |
| github_repository_project | Exported Attributes for `github_repository_project`. |
| github_repository_webhook | Exported Attributes for `github_repository_webhook`. |
| github_team_repository | Exported Attributes for `github_team_repository`. |
<!-- END_TF_DOCS -->

## Notes

### Upgrades from `3.0.0` to `4.x.x`

As part of the updates and upgrades that were made for the `4.x.x` release, all Terraform resource identifiers were renamed from `this` to `main`.
See [`./moved.tf`](https://github.com/ksatirli/terraform-github-repository/blob/main/moved.tf) and the [Terraform documentation](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring#moved-block-syntax) for more information.

#### Branch for GitHub Pages

Prior to `4.0.0`, the branch for the GitHub Pages feature was sourced from the `default_branch` variable.

From `4.0.0` onwards, the branch for GitHub Pages can be set through the `pages_branch` variable. The default is `gh-pages`.

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

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-github-repository/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
