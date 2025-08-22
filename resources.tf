# Create a zip file of your site content (index.html in current directory)
data "archive_file" "site_zip" {
  type        = "zip"
  source_dir  = path.module          # current dir: terraform-netlify-project/
  output_path = "${path.module}/site.zip"
}

# Deploy to your existing Netlify site
resource "netlify_deploy" "main" {
  site_id   = var.site_id
  zip_file  = data.archive_file.site_zip.output_path
  draft     = false
}
