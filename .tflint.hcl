# https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/module-inspection.md
config {
  module = false
  force  = false
}

# required providers MUST be set in the root module, not in (this) child module
rule "terraform_required_providers" {
  enabled = false
}

# required version MUST be set in the root module, not in (this) child module
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}

# neither directory in this repository is a module
rule "terraform_standard_module_structure" {
  enabled = false
}

rule "terraform_workspace_remote" {
  enabled = true
}
