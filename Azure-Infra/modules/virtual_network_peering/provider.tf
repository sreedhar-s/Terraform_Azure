terraform{
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.73.0"
            # configuration_aliases = [ azurerm, azurerm.hub ]
        }
    }
}

provider "azurerm" {
    features {}
}

provider "azurerm" {
    alias = "hub"
    features {}
    subscription_id = "c4c1d27e-dfb0-476d-90b9-16e8f0794214"
}