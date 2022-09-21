#!/bin/bash

terraform fmt -recursive

terraform-docs .

for branch in basic branch_protection complex deploy_keys files issue_labels pages project project_columns template
do
  terraform-docs ./examples/${branch}

  terraform init -upgrade
#  cd ./examples/${branch}
#
#  terraform init -upgrade
#
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#  echo " "
#
#  terraform destroy -auto-approve
#
#  terraform apply -auto-approve
#
#  read -s -n 1 -p "Press any key to continue . . ."
#
#  cd ../..
done
