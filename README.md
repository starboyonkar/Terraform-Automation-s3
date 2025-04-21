# 🚀 Terraform Project: Automated Creation of 5 S3 Buckets

This project uses **Terraform** to create and manage **five AWS S3 buckets** with automation features. It can also destroy them after a set interval using a shell script.

## 🛠️ Technologies Used

- **Terraform**
- **AWS S3**
- **AWS IAM**
- **Shell Script** (for optional timed destruction)
- **VS Code**

---

## 📁 Project Structure

```
terraform-s3-buckets/
├── main.tf
├── variables.tf
├── auto_destroy.sh
├── README.md
```

---

## 📦 S3 Buckets Created

- `plan-bucket-123`
- `code-bucket-123`
- `build-bucket-123`
- `test-bucket-123`
- `deploy-bucket-123`

> You can change these names in the `terraform.tfvars` or directly in `main.tf`

---

## 🔧 Prerequisites

1. **Install Terraform**  
   [Download Terraform](https://developer.hashicorp.com/terraform/downloads)

2. **Install AWS CLI**  
   [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

3. **Configure AWS credentials:**
```bash
aws configure
```

---

## 🚀 Steps to Deploy

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/terraform-s3-buckets.git
cd terraform-s3-buckets
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Validate Configuration
```bash
terraform validate
```

### 4. Preview the Plan
```bash
terraform plan
```

### 5. Apply Configuration
```bash
terraform apply
```

---

## 🧨 (Optional) Auto Destroy After Some Time

### Make the script executable:
```bash
chmod +x auto_destroy.sh
```

### Run the script
```bash
./auto_destroy.sh
```

This will automatically trigger:
```bash
terraform destroy -auto-approve
```
after a 5-minute delay (can be adjusted in the script).

---

## ✅ Output Example

```
aws_s3_bucket.multi_bucket[0]: Creation complete after 3s [id=plan-bucket-123]
aws_s3_bucket.multi_bucket[1]: Creation complete after 3s [id=code-bucket-123]
...
```

---

## 🧹 To Destroy Buckets Manually

```bash
terraform destroy
```

---

## 📝 Author

**Onkar Chaugule**  
DevOps & Cloud Engineer Trainee  
[LinkedIn](https://linkedin.com/in/onkar-chaugule)

---

## 📄 License

MIT
