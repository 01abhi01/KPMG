terraform init -input=false \
  -backend-config="resource_group_name=" \
    -backend-config="storage_account_name=tfstate" \
    -backend-config="container_name=state" \
    -backend-config="key=.tfstate" \
  # Remote state configiguration in a blob storage container
