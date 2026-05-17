terraform{
    backend "azurerm" {
        resource_group_name = "dt-stg-rg"
        storage_account_name = "dtstgdev4001"
        container_name = "terraform-state"
        key = "dev.terraform.tfstate"
        use_azuread_auth = true
    }

    required_providers {
        azurerm = {
        source = "hashicorp/azurerm"
        version = "4.73.0"
        }
    }
}