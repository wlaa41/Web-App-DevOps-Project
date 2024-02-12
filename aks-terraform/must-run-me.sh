# Subscription ID: Unique identifier for your Azure subscription.
export TF_VAR_subscription_id='<place you info>'

# Tenant ID: Unique identifier for your Azure Active Directory tenant.
export TF_VAR_tenant_id='<place you info>'

# If it was Dynamic Fetch current public IP address
# export TF_VAR_my_public_ip=$(curl -s ifconfig.me)


# Azure Service Principal
# Azure Service Principal
# Client ID: Identifier for the Azure Service Principal used by Terraform.
export TF_VAR_client_id='<place you info>'

# Client Secret: Credential for the Azure Service Principal used by Terraform.
export TF_VAR_client_secret='<place you info>'


# my public IP address
export TF_VAR_my_ip_address='<place you info>'

echo 'Variables are successfully exported'