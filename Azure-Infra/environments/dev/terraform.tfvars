rgs = {
    vnt_rg = {
        name = "DT-VNT-RG"
        location = "southeastasia"
    }
}

vnet = {
    vnt = {
        name = "DT-DEV-VNT"
        address_space = ["10.101.254.48/28"]
        location = "southeastasia"
        rg_name = "DT-VNT-RG"
    }
}