output "rgoutputmain" {
  value = {
    for k, v in module.rg.outputrg : k => {
      id   = v.id
      name = v.name
    }
  }
}

output "vnetoutputmain" {
  value = {
    for k, v in module.vnet.outputvnet : k => {
      name = v.name
    }
  }
}

output "subnetoutputmain" {
  value = {
    for k, v in module.subnet.outputsubnet : k => {
      name = v.name
    }
  }
}

output "serviceoutputmain" {
  value = {
    for k, v in module.srvplan.outputsrvpln : k => {
      name = v.name
    }
  }
}

output "appserviceoutputmain" {
  value = {
    for k, v in module.appsrv.outputappservice : k => {
      name = v.name
    }
  }
}

output "sqldboutputmain" {
  value = {
    server = {
      for k, v in module.SQLdB.outputsqlserver : k => {
        name = v.name
      }
    }
    db = {
      for k, v in module.SQLdB.outputsqldb : k => {
        name = v.name
      }
    }
  }
}


output "apgwoutputmain" {
  value = {
    for k, v in module.apgw.outputapgw : k => {
      name = v.name
    }
  }
}

output "pipoutputmain" {
  value = {
    for k, v in module.pip.outputpip : k => {
      name = v.name
    }
  }
}
