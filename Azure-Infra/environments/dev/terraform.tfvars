rgs = {
    vnt_rg = {
        name = "DT-VNT-RG"
        location = "southeastasia"
    },

    rtb_rg = {
        name = "DT-RTB-RG"
        location = "southeastasia"
    },

    vm_rg = {
        name = "DT-VM-RG"
        location = "southeastasia"
    }

    stg_rg = {
        name = "DT-STG-DEV-RG"
        location = "southeastasia"
    }
}

vnt = {
    vnt = {
        name = "DT-DEV-VNT"
        address_space = ["10.101.254.64/27"]
        location = "southeastasia"
        rg_name = "DT-VNT-RG"
    }
}

snt = {
    snt1 = {
        name = "DT-DEV-SNET1"
        address_prefixes = ["10.101.254.64/28"]
        rg_name = "DT-VNT-RG"
        vnt_name = "DT-DEV-VNT"
    },
    snt2 = {
        name = "DT-DEV-SNET2"
        address_prefixes = ["10.101.254.80/28"]
        rg_name = "DT-VNT-RG"
        vnt_name = "DT-DEV-VNT"
    }
}

route_table = {
    rtb1 = {
        name = "DT-RTB-DEV-4001"
        location = "southeastasia"
        rg_name = "DT-RTB-RG"
    }
}

routes = {
    route1 = {
        name = "Default-Internet"
        resource_group_name = "DT-RTB-RG"
        route_table_name = "DT-RTB-DEV-4001"
        address_prefix = "0.0.0.0/0"
        next_hop_type = "VirtualAppliance"
        next_hop_in_ip_address = "10.101.0.196"
    }
}