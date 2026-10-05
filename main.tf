terraform {
  required_version = ">= 1.12"

  cloud {
    organization = "oceaniccloud"

    workspaces {
      name = "tf-hcp-demo"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

resource "random_pet" "server_name" {
  length = 2
  prefix = var.environment
}

output "server_name" {
  value = random_pet.server_name.id
}
