To automate the VPC orchestration with Terraform, Here are 2 scripts:
1. main.tf
2. variables.tf

All the logics behind to automate the process of creation of AWS VPC are under main.tf, where we are the configure the VPC along with VPC
components like:
1. Subnets
2. Internet Gateway
3. Route tables
4. IP Allocation.
5. Network ACL
6. Security groups
