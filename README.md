# Terraform Module Task

## Context

You are joining a team that uses Terraform as its primary infrastructure-as-code tool.
This task evaluates your ability to learn and apply Terraform concepts independently.

You are encouraged to use the [Terraform documentation](https://developer.hashicorp.com/terraform/language) freely — this is not a memory test.

## Goal

Build a reusable Terraform module that models an EC2 fleet using `terraform_data` resources.
The input data is a JSON file describing instances, subnets, security groups, and tags.

## What is already provided

| File | Status |
|---|---|
| `example/inputs.json` | ✅ Provided — do not modify |
| `example/main.tf` | ✅ Provided — do not modify |
| `example/outputs.tf` | ✅ Provided — do not modify |
| `versions.tf` | ✅ Provided — do not modify |
| `variables.tf` | 🔧 Define the variable type to match `inputs.json` |
| `main.tf` | 🔧 Implement the module logic |
| `outputs.tf` | 🔧 Implement all outputs |

## What the module should do

1. Receive the decoded JSON via `var.config`.
2. Build a normalized map of **all** instances, where each instance is enriched with:
   - A resolved `subnet_id` from `subnet_ids` using the instance's `subnet_index`
   - A combined list of security groups (common + per-instance)
   - A combined map of tags (common + per-instance + `Name`)
3. Filter out disabled instances (`enabled = false`).
4. Create one `terraform_data.instance` per enabled instance.
5. Create one `terraform_data.eip` per enabled instance that has `associate_eip = true`.

## Important edge cases in inputs.json

- `worker-01` has `enabled: false` — it should not produce any resource.
- `bastion-01` does **not** have a `security_group_ids` key at all — your code must not crash.

## Terraform features you will need

Read the documentation for these — they are all required:

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

Expected plan result: **5 resources** (3 instances + 2 EIPs).

## Rules

- Do **not** use the AWS provider
- Do **not** modify files under `example/`
- Do **not** hardcode instance names or counts
- You **may** use the Terraform documentation and any search engine
- Time limit: **90 minutes**