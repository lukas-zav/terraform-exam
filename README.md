# Terraform Module Task

## Context

You are joining a team that uses Terraform as its primary infrastructure-as-code tool.
This task evaluates your ability to learn and apply Terraform concepts independently.

You are encouraged to use the [Terraform documentation](https://developer.hashicorp.com/terraform/language) freely — this is not a memory test.

## Getting started

1. **Fork** this repository to your own GitHub account.
2. **Clone** your fork locally.
4. Implement the module (see instructions below).
5. Commit and push your changes.
6. Open a **Pull Request** from your branch back to the original repository's `main` branch.

## Goal

Build a reusable Terraform module that models an EC2 fleet using `terraform_data` resources.
The input data is a JSON file describing instances, subnets, security groups, and tags.

## Project structure

```
terraform-exam/
├── example/
│   ├── inputs.json        ← do not modify
│   ├── main.tf            ← do not modify
│   └── outputs.tf         ← do not modify
├── modules/
│   └── ec2_fleet/
│       ├── main.tf        ← 🔧 implement the module logic
│       ├── outputs.tf     ← 🔧 implement the two outputs
│       ├── variables.tf   ← 🔧 define the variable type
│       └── versions.tf    ← do not modify
└── README.md
```

## What the module should do

1. Receive the decoded JSON via `var.config`.
2. Build a normalized map of **all** instances, where each instance is enriched with:
   - A resolved `subnet_id` from `subnet_ids` using the instance's `subnet_index`
   - A combined list of security groups (common + per-instance)
   - A combined map of tags (common + per-instance + `Name`)
3. Filter out disabled instances (`enabled = false`).
4. Use a single `terraform_data.instance` resource block with `for_each` to dynamically create one instance per entry in the enabled map.

## Outputs

| Output | Description |
|---|---|
| `enabled_instances` | Map of all enabled instances with their enriched fields |
| `instance_ids` | Map of `terraform_data` resource IDs by instance name |

## Important edge cases in inputs.json

- `worker-01` has `enabled: false` — it should not produce any resource.
- `bastion-01` does **not** have a `security_group_ids` key at all — your code must not crash.

## Terraform features you might need

Read the documentation for these:

| Feature | Documentation |
|---|---|
| `for` expression | https://developer.hashicorp.com/terraform/language/expressions/for |
| `for_each` | https://developer.hashicorp.com/terraform/language/meta-arguments/for_each |
| `merge()` | https://developer.hashicorp.com/terraform/language/functions/merge |
| `concat()` | https://developer.hashicorp.com/terraform/language/functions/concat |
| `try()` | https://developer.hashicorp.com/terraform/language/functions/try |
| `optional()` | https://developer.hashicorp.com/terraform/language/expressions/type-constraints#optional |
| Type constraints | https://developer.hashicorp.com/terraform/language/expressions/type-constraints |

## Validation

Your solution must pass:

```
cd example
terraform init
terraform validate
terraform plan
```

Expected plan result: **3 resources** (3 enabled instances).

## Rules

- Do **not** use the AWS provider
- Do **not** modify files under `example/`
- Do **not** hardcode instance names or counts
- You **may** use the Terraform documentation, any search engine or AI
