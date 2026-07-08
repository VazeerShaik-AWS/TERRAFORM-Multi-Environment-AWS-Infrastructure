# Paste values from Project 3 state-backend: terraform output
bucket               = "vs-terraform-state-"
key                  = "platform/terraform.tfstate"
region               = "us-east-1"
dynamodb_table       = "vs-terraform-state-lock"
encrypt              = true
workspace_key_prefix = "env"
