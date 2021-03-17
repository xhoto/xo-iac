module "global_variables" {
  source="../../mgmt/global_variables"
}

provider "helm" {
  kubernetes {
    host                   = var.aks.kube_config.0.host
    client_certificate     = base64decode(var.aks.kube_config.0.client_certificate)
    client_key             = base64decode(var.aks.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(var.aks.kube_config.0.cluster_ca_certificate)
  }
}

resource "null_resource" "get_credential" {
  provisioner "local-exec" {
    command = "az aks get-credentials --overwrite-existing --resource-group ${var.rg.name} --name ${var.aks.name} --subscription ${var.az_subscription_id}"
  }
  depends_on            = [ var.rg, var.aks, var.uai ]
}

resource "null_resource" "deployment_rbac" {
  provisioner "local-exec" {
    command = "kubectl create -f ${path.module}/deployment-rbac.yaml"
  }
  depends_on            = [ null_resource.get_credential ]
}

resource "helm_release" "agic" {
  name       = var.name
  repository = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart      = "ingress-azure"
  version    = "1.2.0"

  values = [
    file("${path.module}/helm-config.yaml")
  ]

  set {
    type = "string"
    name = "appgw.subscriptionId"
    value = var.az_subscription_id
  }

  set {
    type = "string"
    name = "appgw.resourceGroup"
    value = var.rg.name
  }

  set {
    type = "string"
    name = "appgw.name"
    value = var.agw.name
  }

  set {
    type = "string"
    name = "armAuth.identityResourceID"
    value = var.uai.id
  }

  set {
    type = "string"
    name = "armAuth.identityClientID"
    value = var.uai.client_id
  }

  set {
    name = "appgw.usePrivateIP"
    value = var.usePrivateIP
  }

  depends_on            = [ null_resource.deployment_rbac, var.aks, var.agw, var.uai ]
}