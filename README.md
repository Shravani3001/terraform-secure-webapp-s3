# Secure Web App Deployment on AWS using Terraform + Auto Scaling + S3 + ALB

## Project Overview

This project automates the deployment of a highly available and secure web application on AWS using **Terraform**. It provisions infrastructure with a **private S3 bucket** hosting the HTML page, served via **NGINX on EC2** instances that are part of an **Auto Scaling Group (ASG)**. Incoming traffic is routed through an **Application Load Balancer (ALB)** deployed in a **public subnet**, while EC2 instances remain in **private subnets** for security.

---

## Tools and AWS Services Used

- **Terraform** – Infrastructure as Code
- **Amazon EC2** – Hosting NGINX web servers
- **Amazon S3 (Private)** – Storing the HTML file
- **AWS Secrets Manager** – Added as part of the project to practice secure secret management in AWS
- **Application Load Balancer (ALB)** – Routing HTTP traffic
- **Auto Scaling Group (ASG)** – High availability and scalability
- **Launch Template** – EC2 instance configuration
- **IAM Role** – S3 access from EC2
- **VPC, Subnets, Internet Gateway, NAT Gateway, Route Tables** – Custom networking
- **Security Groups** – Controlling inbound/outbound access

---

## Prerequisites

Before you begin, ensure you have the following:

- Terraform installed 
- AWS CLI configured with your credentials
- An AWS account with programmatic access
- Basic understanding of AWS networking and Terraform

---

## Features

- Fully automated infrastructure provisioning with Terraform
- EC2 instances in private subnets (secure architecture)
- Load-balanced traffic through ALB in public subnets
- HTML served from a private S3 bucket via NGINX
- Auto Scaling enabled to handle traffic spikes
- Custom IAM role with least-privilege access to S3
- Secrets Manager module to create secrets 

---

## Project Structure
```bash
terraform-secure-webapp-s3/
│
├── modules/
│   ├── alb/main.tf, outputs.tf, variables.tf 
│   ├── iam/main.tf, outputs.tf, variables.tf 
│   ├── ec2/main.tf, outputs.tf, variables.tf 
│   ├── s3/index.html, main.tf, outputs.tf, variables.tf 
│   ├── secrets/main.tf, outputs.tf, variables.tf 
│   ├── sg/main.tf, outputs.tf, variables.tf 
│   └── vpc/main.tf, outputs.tf, variables.tf 
│
├── userdata.sh              
│
├── main.tf                        
├── variables.tf                   
├── outputs.tf                     
├── terraform.tfvars                                 
├── .gitignore                   
└── README.md                     
```

---

## How It Works

- **Terraform** provisions:
   - A custom VPC with public and private subnets
   - A security group allowing HTTP traffic
   - An S3 bucket (private) to store the HTML content
   - IAM roles for EC2 instances to access S3
   - A launch template and Auto Scaling Group (ASG)
   - An Application Load Balancer (ALB) with a target group
- **User Data Script** installs NGINX on each EC2 instance and fetches the HTML page from the S3 bucket.
- The **ALB** forwards traffic to healthy EC2 instances in the private subnets.
- Users access the application through the **ALB DNS name**.
- **Secrets Manager module** is also executed to create and store mock/test secrets for learning purposes.
- **Note:** These secrets are not used by other services in this project — they serve as a demo of how secrets can be created and managed via Terraform.

---

## Architecture Diagram

---

## Steps to Run the Project

**1. Clone the Repository**
```bash
git clone https://github.com/Shravani3001/terraform-secure-webapp-s3.git
cd terraform-secure-webapp-s3
```

**2. Initialize Terraform**
```bash
terraform init
```

**3. Review Plan**
```bash
terraform plan
```

**4. Apply Infrastructure**
```bash
terraform apply
```

**5. Access the Web App**

Copy the DNS name of the ALB from Terraform output and visit it in your browser to see the deployed HTML page.
```bash
http://aln-dns-name
```

---

## Output


---

## About Me


