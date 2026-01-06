#subscription_id = ""

rg = {
  rg1 = {
    name     = "Aftabwebapprg"
    location = "eastus"
  }
  # rg2 = {
  #   name     = "webapprg1"
  #   location = "westus"
  # }
}

sa = {
  sa1 = {
    name    = "devnewjavasa1"
    at      = "Standard"
    acctype = "GRS"
    kk      = "rg1"
  }

  # sa2 = {
  #   name    = "sa2"
  #   at      = "Standard"
  #   acctype = "GRS"
  #   kk      = "rg2"
  # }
}


vnet = {
  vnet1 = {
    vnetname    = "aftabvnet"
    adddrsspace = ["10.0.0.0/16"]
    aa          = "rg1"
  }
}
#   vnet2 = {
#     vnetname    = "aftabvnet2"
#     adddrsspace = ["192.168.0.0/24"]
#     aa          = "rg2"
#   }
# }

subnet = {
  subnet1 = {
    subnetname = "prodsub"
    adrspac    = ["10.0.1.0/24"]
    snkey      = "rg1"
  }
}
#     subnet2 = {
#         subnetname = "devsub"
#         adrspac = ["192.168.1.0/24"]
#         snkey = "rg2"
#     }
#  }

appsrv = {
  server1 = {
    servname = "Aftabserver"
    srvkey   = "rg1"
    srplnkey = "srvplan1"
  }
}
srvplan = {
  srvplan1 = {
    srvplanname = "aftabplan1"
    tier        = "Standard"
    size        = "S1"
    spkey       = "rg1"
  }
  # srvplan2 = {
  #     srvplanname = "aftabplan2"  
  #     tier   = "Standard"
  #     size = "S1"
  #     spkey = "rg2"
  # }
}

sqlserver = {
  sqlserver1 = {
    sqlserver_name = "aftabsqlserver"
    ver            = "12.0"
    admin_login    = "4dm1n157r470r"
    admin_pswd     = "4-v3ry-53cr37-p455w0rd"
    serverkey      = "rg1"
  }
}
sql_db = {
  sql_db1 = {
    db_name      = "aftabdb"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    size         = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    serverkey    = "sqlserver1"
  }
}


appGw = {
  GW1 = {
    lbname                 = "FirstAppGw"
    sku_name               = "Standard_v2"
    tier                   = "Standard_v2"
    capacity               = "2"
    gwip_name              = "FirstAppGw-ip-configuration"
    fe_name                = "FirstAppGw_feport"
    port                   = "80"
    fe_ipname              = "FirstAppGw_ipname"
    backsdrs_name          = "FirstAppGw_backsdrs_name"
    backhttp_setting       = "FirstAppGw_backhttp_setting"
    backhttp_cookie        = "Disabled"
    backhttp_path          = "FirstAppGw_path"
    backhttp_port          = "80"
    backhttp_protocol      = "Http"
    backhttp_reqtimeout    = "60"
    httplisten_name        = "FirstAppGw_httplisten"
    httplisten_Fipconfname = "FirstAppGw_httplisten_Fipconf"
    httplisten_fportname   = "FirstAppGw_httplisten_fportname"
    httplisten_protocol    = "Http"
    rrr_name               = "FirstAppGw_rrr"
    rrr_priority           = "9"
    rrr_ruletype           = "Basic"
    appgwkey               = "rg1"
    subkey                 = "subnet1"
    pipkey                 = "pip1"
  }
}

pip = {
  pip1 = {
    pip_name     = "devpip"
    alloc_method = "Static"
    rgkey        = "rg1"

  }
}