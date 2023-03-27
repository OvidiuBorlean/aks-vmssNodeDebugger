# aks-vmssNodeDebugger
AKS Node Debuger with VMSS resources

## Prerquisites

Azure CLI connected to Azure Subscription where the AKS cluster is running. This script uses **az vmss run-command invoke** therefore it working on AKS clusters with VMSS as the backend node pool. 
Azure Storage Account Container SAS URL with Write permission

![SAS](sas.png)

Getting SAS URL

![SAS](generate.png)


