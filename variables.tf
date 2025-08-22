variable "netlify_token" {
  description = "Netlify personal access token"
  type        = string
  sensitive   = true
}

variable "netlify_team" {
  description = "The Netlify team slug (from your dashboard URL, e.g., idris-shittu)"
  type        = string
}

variable "site_id" {
  description = "The Netlify Site API ID (from Site settings → General → Site details)"
  type        = string
  default     = "2676b254-f213-4633-b97e-1a91a5e60123"
}
