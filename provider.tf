provider "aws" {
  region  = var.region
  profile = var.perfil
  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}