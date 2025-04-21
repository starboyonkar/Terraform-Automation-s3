#!/bin/bash

echo "Running terraform init..."
terraform init

echo "Applying terraform plan..."
terraform apply -auto-approve

echo "Waiting for 2 minutes before destroying resources..."
sleep 120

echo "Destroying terraform-managed resources..."
terraform destroy -auto-approve