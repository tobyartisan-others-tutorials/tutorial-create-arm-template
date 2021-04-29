#!/bin/bash

# Script can be run by executing the following commands
# > az login --tenant [FQDN of tenant]
# > az account set --subscription [SubscriptionID/SubscriptionName]
# > bash setup.sh


# Create resource group
rgName="rgTutorialArmTemplate"
echo "Creating resource group $rgName"
az group create \
  --name $rgName \
  --location "Central US"

# Deploy ARM template
echo "Deploying  ARM template"
templateFile="./azuredeploy.json"
az deployment group create \
  --name blanktemplate \
  --resource-group $rgName \
  --template-file $templateFile

# After completion of command, check ProvisioningState to see if deployment succeeded.
# If deployment failed, then use the "verbose" switch to get more information.
# If needed, use the "debug" switch to get more information for debugging.
