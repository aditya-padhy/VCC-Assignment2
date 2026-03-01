# GCP VM Auto-Scaling and Security Implementation

## Overview

This project implements a scalable and secure cloud infrastructure on Google Cloud Platform (GCP). The setup demonstrates:

- Virtual Machine deployment
- Managed Instance Group configuration
- CPU-based auto-scaling
- Global HTTP Load Balancer
- IAM access control
- Firewall rule enforcement
- Stress-based validation

The system dynamically adjusts resources based on workload while maintaining controlled network and identity access.

---

## Prerequisites

- Google Cloud account
- `gcloud` CLI installed
- Active GCP project selected

Initialize configuration:

```bash
gcloud init
```

Ensure the correct project is active:

```bash
gcloud config get-value project
```

---

## Deployment Steps

Run the infrastructure scripts in the following order:

```bash
cd scripts
./create_instance_template.sh
./create_instance_group.sh
./configure_autoscaling.sh
./create_load_balancer.sh
./configure_firewall.sh
./configure_iam.sh
```

This will:

| Step | Script | Action |
|------|--------|--------|
| 1 | `create_instance_template.sh` | Create a VM template (Debian 12, e2-micro) |
| 2 | `create_instance_group.sh` | Deploy a managed instance group |
| 3 | `configure_autoscaling.sh` | Enable auto-scaling (min: 1, max: 5, target CPU: 60%) |
| 4 | `create_load_balancer.sh` | Configure HTTP load balancing |
| 5 | `configure_firewall.sh` | Apply firewall rule (Ingress TCP:80) |
| 6 | `configure_iam.sh` | Assign IAM Viewer role |

---

## Testing and Validation

### 1. Auto-Scaling Test

Generate CPU load:

```bash
cd testing
./stress_test.sh
```

**Result:**
- When CPU utilization exceeds **60%**, new instances are automatically created
- After load reduces, instances scale back down to the minimum size
- Scaling activity can be monitored in:
  > GCP Console → Compute Engine → Instance Groups

### 2. Load Balancer Test

Access the external IP of the Load Balancer in a browser.

**Result:**
- HTTP response from Apache web server
- Traffic distributed across healthy instances

### 3. Firewall Validation

| Rule | Result |
|------|--------|
| Firewall rule **allowing** TCP:80 | Web page loads successfully |
| Rule changed to **Deny** | Connection fails |

> This confirms proper ingress traffic control.

---

## Security Configuration

- **IAM Viewer role** assigned following the principle of least privilege
- **Custom firewall rule** with priority `10`
- Only **HTTP traffic** allowed through the defined ingress rule

---

## Outcome

The infrastructure:

- Scales horizontally based on CPU workload
- Maintains high availability using load balancing
- Enforces controlled network access via firewall rules
- Implements role-based access control using IAM

This demonstrates core cloud computing principles: **virtualization**, **elasticity**, **high availability**, and **secure access management**.
