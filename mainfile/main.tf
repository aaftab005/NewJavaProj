module "rg" {
  source = "../module/RG"
  rg     = var.rg
}

module "sa" {
  source = "../module/storageaccount"
  sa     = var.sa
  gg     = module.rg.outputrg
}

module "vnet" {
  source   = "../module/vnet"
  vnet     = var.vnet
  vnetcall = module.rg.outputrg
}

module "subnet" {
  source     = "../module/subnet"
  subnet     = var.subnet
  subnetcall = module.rg.outputrg
}

module "srvplan" {
  source      = "../module/serviceplan"
  srvplan     = var.srvplan
  srvplancall = module.rg.outputrg
}

module "appsrv" {
  source  = "../module/appservice"
  appsrv  = var.appsrv
  srvcall = module.rg.outputrg
  srviplncall = module.srvplan.outputsrvpln
}

module "SQLdB" {
  source         = "../module/sqlserver"
  sqlserver      = var.sqlserver
  sqlserver_call = module.rg.outputrg
  sql_db         = var.sql_db

}

module "apgw" {
  source     = "../module/applicationgateway"
  appGw      = var.appGw
  rgcall     = module.rg.outputrg
  subnetcall = module.subnet.outputsubnet
  pipcall    = module.pip.outputpip
}

module "pip" {
  source = "../module/pip"
  pip    = var.pip
  rgcall = module.rg.outputrg
}