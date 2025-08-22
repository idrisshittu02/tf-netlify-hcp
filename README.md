# Terraform Netlify Deployment

This project deploys a static website to Netlify using Terraform with HCP Terraform for remote state management.

## Prerequisites
- Terraform >= 1.0
- Netlify account and Personal Access Token
- HCP Terraform account and organization

## Setup
1. Clone this repository
2. Update `main.tf` with your HCP organization name
3. Set up environment variables in your HCP workspace:
   - `NETLIFY_TOKEN`: Your Netlify Personal Access Token
4. Run `terraform login` to authenticate with HCP
5. Run `terraform init` to initialize
6. Run `terraform plan` to preview changes
7. Run `terraform apply` to deploy

## Outputs
- `site_url`: The live URL of your deployed site
- `site_id`: Netlify site identifier
- `random_suffix`: Random suffix for unique naming

## Cleanup
Run `terraform destroy` to remove all resources.
