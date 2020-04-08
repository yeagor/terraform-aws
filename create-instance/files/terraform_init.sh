#!/bin/bash

# Don't use `terraform init`. It won't work.
# Initialize Terraform with this script
# See for details: https://github.com/hashicorp/terraform/issues/13022#issuecomment-294262392

# Put actual values to export
export TF_VAR_profile=
export TF_VAR_region=
export TF_VAR_bucket=
export TF_VAR_env=

terraform init \
     -backend-config "profile=$TF_VAR_profile" \
     -backend-config "region=$TF_VAR_region" \
     -backend-config "bucket=$TF_VAR_bucket" \
     -backend-config "key=$TF_VAR_env/state.tfstate"