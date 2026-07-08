# Multi-Environment AWS Infrastructure using Terraform

A production-style Terraform project that deploys isolated VPC networking and EC2 web servers across **dev**, **stage**, and **prod** environments using Terraform Workspaces, remote state stored in Amazon S3, and state locking with DynamoDB.

## Architecture

Internet
│
├── Internet Gateway
├── VPC
│   ├── Public Subnet
│   ├── Route Table (0.0.0.0/0 → IGW)
│   └── Security Group (HTTP / TCP 80)
├── EC2 Instance (Amazon Linux 2023)
├── Terraform Workspaces
│   ├── dev
│   ├── stage
│   └── prod
└── Remote State (Amazon S3 + DynamoDB Lock)
```

## Features

- Multi-environment deployments using Terraform Workspaces
- Separate VPC and EC2 stack per environment
- Environment-specific variables with `.tfvars`
- Remote Terraform state stored in Amazon S3
- State locking using DynamoDB
- Public subnet with internet-facing EC2 web server
- Consistent resource naming across environments

## Usage

### 1. Create the Remote Backend

Deploy Project 3 first:

```bash
cd state-backend

terraform init
terraform apply

terraform output
```

### 3. Initialize Terraform

```bash
terraform init -backend-config=environments/backend.hcl
```

### 4. Deploy the Development Environment

```bash
terraform workspace new dev
terraform workspace select dev

terraform apply \
-var-file=environments/dev.tfvars
```

### 5. Deploy the Staging Environment

```bash
terraform workspace new stage
terraform workspace select stage

terraform apply \
-var-file=environments/stage.tfvars
```

### 6. Deploy the Production Environment

```bash
terraform workspace new prod
terraform workspace select prod

terraform apply \
-var-file=environments/prod.tfvars
```

### Production

```bash
terraform workspace select prod

terraform destroy \
-var-file=environments/prod.tfvars
```

### Staging

```bash
terraform workspace select stage

terraform destroy \
-var-file=environments/stage.tfvars
```

### Development

```bash
terraform workspace select dev

terraform destroy \
-var-file=environments/dev.tfvars
```

### Backend Infrastructure

```bash
cd state-backend

terraform destroy
```

## Technologies Used

- Terraform
- Amazon VPC
- Amazon EC2
- Amazon S3
- Amazon DynamoDB
- AWS CLI

## Author

**Vazeer Shaik**
