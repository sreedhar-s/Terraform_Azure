rgs = {
    vnt_rg = {
        name = "DT-VNT-RG"
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

remote_to_local = {
  name = "OI-VNT-TO-DT-DEV-VNT"
  rg_name = "DT-VNT-RG"
  vnt_name = "OI-VNT"
  allow_virtual_network_access = true,
  allow_forwarded_traffic = true,
  allow_gateway_transit = true,
  use_remote_gateways = false
}

local_to_remote = {
  name = "DT-DEV-VNT-TO-OI-VNT"
  rg_name = "DT-VNT-RG"
  vnt_name = "DT-DEV-VNT"
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = false
  use_remote_gateways = true
}