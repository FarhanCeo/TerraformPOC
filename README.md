## This is the example of Modules in Terraform covering how to create a VM in Azure.

```
env:
        ARM_SUBSCRIPTION_ID: ${{ secrets.SUBSCRIPTIONID }}   --> Authenticates Terraform with Azure.
        ARM_CLIENT_ID: ${{ secrets.CLIENTID }}
        ARM_CLIENT_SECRET: ${{ secrets.CLIENTSECRET }}
        ARM_TENANT_ID: ${{ secrets.TENANTID }}
        TF_VAR_vm_username: ${{ secrets.VM_USERNAME }}      --> Passes input variables for your Terraform configuration.
        TF_VAR_vm_password: ${{ secrets.VM_PASSWORD }}
```
