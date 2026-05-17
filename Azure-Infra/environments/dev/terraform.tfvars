rgs = {
    vnt_rg = {
        name = "DT-VNT-RG"
        location = "southeastasia"
    }
}

vnet = {
    vnt = {
        name = "DT-DEV-VNT"
        address_space = ["10.101.254.64/27"]
        location = "southeastasia"
        rg_name = "DT-VNT-RG"
    }
}

snet = {
    snet1 = {
        name = "DT-DEV-SNET1"
        address_prefixes = ["10.101.254.64/28"]
        rg_name = "DT-VNT-RG"
        vnt_name = "DT-DEV-VNT"
    },
    snet2 = {
        name = "DT-DEV-SNET2"
        address_prefixes = ["10.101.254.80/28"]
        rg_name = "DT-VNT-RG"
        vnt_name = "DT-DEV-VNT"
    }
}