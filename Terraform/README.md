# NotesApp — Terraform Infrastructure

A faithful Terraform replica of the original `provision.sh` bash script.

## Files

| File | Purpose |
|------|---------|
| `main.tf` | All AWS resources (VPC, subnet, IGW, route table, SG, key pair, EC2) |
| `variables.tf` | Configurable inputs with sensible defaults |
| `outputs.tf` | SSH command, public IP, and app URL |

## Usage

```bash
1. Initialise — downloads the AWS provider
terraform init

2. Preview what will be created
terraform plan

3. Apply (type 'yes' to confirm)
terraform apply

4. Connect once the instance is ready (~2 min for user-data to finish)
$(terraform output -raw ssh_command)

5. Tear everything down when done
terraform destroy
```

## Outputs

After `apply` completes:

```
public_ip      = "x.x.x.x"
ssh_command    = "ssh -i notesapp-key.pem ec2-user@x.x.x.x"
notesapp_url   = "http://x.x.x.x:3000"
```

The private key is written to `notesapp-key.pem` (chmod 400) in the working directory.

## Overriding defaults

```bash
terraform apply \
  -var="region=eu-west-1" \
  -var="instance_type=t3.small"
```

## Notes

- SSH (22), HTTP (80), and app port (3000) are open to `0.0.0.0/0` — same as the original script. Tighten the `cidr_blocks` in `main.tf` for production use.
- The `tls` provider generates the RSA key pair locally; no external key material is needed.
- The AMI filter pins to the exact AMI name from the original script. Update the `values` filter in the `data "aws_ami"` block if you want the latest AL2023 image instead.
