#!/bin/bash
#az aks show -n aks -g aks --query nodeResourceGroup -o tsv
vmssName="aks-nodepool1-71056337-vmss"
vmssRG="MC_AKS_AKS_NORTHEUROPE"

instanceList=$(az vmss list-instances -n $vmssName -g $vmssRG --query "[].[instanceId]" -o tsv)
for instance in $instanceList
do
  echo "Query instance Id: $instance"
  #echo "---> Getting Containerd Status"
  #az vmss run-command invoke -g $vmssRG -n $vmssName --instance-id $instance --command-id RunShellScript --query 'value[0].message' -otsv --scripts  "crictl stats"
  echo "---> Getting Containerd Images"
  az vmss run-command invoke -g $vmssRG -n $vmssName --instance-id $instance --command-id RunShellScript --query 'value[0].message' -otsv --scripts  "crictl ps"
  echo "---> Getting Node Processes"
  az vmss run-command invoke -g $vmssRG -n $vmssName --instance-id $instance --command-id RunShellScript --query 'value[0].message' -otsv --scripts  "ps aux"
  echo "---> Running top command"
  az vmss run-command invoke -g $vmssRG -n $vmssName --instance-id $instance --command-id RunShellScript --query 'value[0].message' -otsv --scripts  "top -b -n 1"
  echo "---> Running free command"
  az vmss run-command invoke -g $vmssRG -n $vmssName --instance-id $instance --command-id RunShellScript --query 'value[0].message' -otsv --scripts  "free -m"
  
  
