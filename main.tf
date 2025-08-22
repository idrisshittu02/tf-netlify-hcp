terraform {
  required_version = ">= 1.0"
  required_providers {
    netlify = {
      source  = "netlify/netlify"
      # Remove or comment out version constraint temporarily
      # version = "~> 1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
}

provider "netlify" {
  token = var.netlify_token
}

# Generate random suffix for unique site name
resource "random_id" "suffix" {
  byte_length = 4
}

# Create a new Netlify site
resource "netlify_site" "example" {
  name = "terraform-demo-${random_id.suffix.hex}"
}

# Zip the local "site" folder (must contain index.html)
data "archive_file" "site" {
  type        = "zip"
  source_dir  = "${path.module}/site"
  output_path = "${path.module}/site.zip"
}

# Deploy that ZIP to Netlify
resource "netlify_deploy" "example" {
  site_id = netlify_site.example.id
  path    = data.archive_file.site.output_path
}