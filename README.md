Automated Creation and Deletion of AWS S3 Buckets Using Terraform

________________________________________
Technology Stack
•	Infrastructure as Code: Terraform
•	Cloud Provider: Amazon Web Services (AWS)
•	CLI Tools: AWS CLI, Terraform CLI
•	Editor: Visual Studio Code
•	Automation Script: Shell script (or PowerShell for Windows)
•	OS: Windows 10+ or Linux (with WSL enabled)
________________________________________
Final Outcome
•	Automatically creates 5 unique S3 buckets:
plan, code, build, test, deploy (with a unique suffix).
•	Deletes the buckets after a specified interval using a script.
________________________________________
Step-by-Step Execution
1. Install Required Tools
Windows Users:
•	 Install Terraform
Install Terraform:
Install Terraform on your system and verify the installation using terraform -v
 

•	 Install AWS CLI
•	 Add both to your system's PATH
•	 Optionally install Git  or use PowerShell
2. Configure AWS Credentials
Run the following command and enter your IAM credentials:
aws configure
You’ll be asked to provide:
•	AWS Access Key ID
•	AWS Secret Access Key
•	Default Region (e.g., eu-west-1)
•	Output format (optional: json, table, or text)

Tools & Technologies Used
Tool	Description	Download Link
Terraform	Infrastructure as Code tool used to manage AWS infrastructure.	Download Terraform
AWS CLI	Command Line Interface to interact with AWS services.	Download AWS CLI

Visual Studio Code	Code editor to write and run Terraform scripts.	Download VS Code

PowerShell / Terminal	Used to execute Terraform & shell commands.	Built-in (Windows/Linux/macOS)

________________________________________
3. Create Terraform Files in VS Code
 Folder Structure:
terraform-s3-auto-delete/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── auto_destroy.sh (or .ps1 for Windows)
________________________________________
4. Terraform Configuration Files
main.tf – Provisions multiple S3 buckets dynamically:
provider "aws" {
  region = "eu-west-1" # match your AWS region
}

resource "aws_s3_bucket" "multi_bucket" {
  count = length(var.bucket_names)
  bucket = var.bucket_names[count.index]
  force_destroy = true
}
variables.tf – Input variable for bucket names:
variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
}
terraform.tfvars – Unique bucket names (must be globally unique):
bucket_names = [
  "onkar-plan-bucket-98321",
  "onkar-code-bucket-98321",
  "onkar-build-bucket-98321",
  "onkar-test-bucket-98321",
  "onkar-deploy-bucket-98321"
]
outputs.tf – Output the bucket names:
output "s3_bucket_names" {
  value = aws_s3_bucket.multi_bucket[*].bucket
}
________________________________________
5. Automate Deletion with Timer Script
auto_destroy.sh (Linux/macOS or WSL):
#!/bin/
echo "Waiting 2 minutes before destroying resources..."
sleep 120
terraform destroy -auto-approve
Or use PowerShell for Windows:
Start-Sleep -Seconds 120
terraform destroy -auto-approve
Make it executable (Linux):

chmod +x auto_destroy.sh
Run:

./auto_destroy.sh
 


5 s3 Buckets have been created on AWS….

 

 
 	6. Initialize, Apply, and Auto-Destroy
terraform init         # Download provider plugins
terraform validate     # Check configuration correctness
terraform apply -auto-approve  # Create S3 buckets
Run the destroy script separately:
./auto_destroy.sh
________________________________________
Common Errors & Fixes
Error	Reason	Fix
AuthorizationHeaderMalformed	  Region mismatch	Match region in Terraform with aws configure
BucketAlreadyExists	 Name conflict (global)	Add unique suffix to each bucket
Command Not Found	AWS CLI or Terraform not installed or PATH not set	Reinstall or add to environment variables
________________________________________
 What I Learned
•	Managing AWS infrastructure using Terraform modules and variables.
•	Importance of region and naming consistency in AWS.
•	Using CLI tools and automation scripts for cleanup.
•	Debugging and handling cloud errors like region mismatch or naming conflicts.
________________________________________
 Use Case & Extension
•	Can be extended to deploy versioned buckets, lifecycle rules, or use in a CI/CD pipeline.
•	Can automate provisioning of more complex infrastructure like EC2, RDS, VPCs.
________________________________________



