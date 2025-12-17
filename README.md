# 🚀 TaskFlow - Production DevOps Project

A complete, production-grade task management platform demonstrating modern DevOps practices.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Deployment](#deployment)
- [Monitoring](#monitoring)
- [Contributing](#contributing)

## 🎯 Overview

TaskFlow is a full-stack application showcasing DevOps best practices:
- **Containerization** with Docker
- **Orchestration** with Kubernetes
- **Cloud Deployment** on AWS EKS
- **CI/CD Automation** with GitHub Actions
- **Monitoring** with CloudWatch
- **Infrastructure as Code** with Terraform

## 🏗️ Architecture
┌─────────────────────────────────────────┐
│         Client Applications             │
└──────────────────┬──────────────────────┘
│ HTTPS
▼
┌─────────────────────────────────────────┐
│      AWS Application Load Balancer      │
└──────────────────┬──────────────────────┘
│
┌──────────┴──────────┐
│                     │
▼                     ▼
┌────────┐            ┌────────┐
│ Pod 1  │            │ Pod 2  │
│Backend │            │Backend │
└────┬───┘            └───┬────┘
└──────────┬─────────┘
│
┌───────────┼───────────┐
│           │           │
▼           ▼           ▼
┌─────────────────────────────────┐
│ AWS Services                    │
├─────────────────────────────────┤
│ • RDS PostgreSQL (Data)         │
│ • ElastiCache Redis (Cache)     │
│ • CloudWatch (Monitoring)       │
│ • VPC (Networking)              │
└─────────────────────────────────┘

## ✨ Features

### Backend API
- RESTful task management endpoints
- Health check monitoring
- Environment-based configuration
- Database persistence
- Redis caching

### Infrastructure
- **Docker**: Multi-stage builds, Alpine optimization
- **Kubernetes**: StatefulSets, Deployments, Services
- **AWS**: EKS, RDS, ElastiCache, VPC
- **Terraform**: Infrastructure as Code
- **Helm**: Package management

### DevOps
- **CI/CD**: GitHub Actions workflows
- **Testing**: Automated tests & checks
- **Security**: Vulnerability scanning
- **Monitoring**: CloudWatch dashboards
- **Logging**: Centralized log collection

## 🚀 Installation

### Prerequisites
- Docker & Docker Compose
- kubectl (Kubernetes CLI)
- Terraform
- AWS CLI
- Node.js 18+

### Local Development
```bash
# Clone repository
git clone https://github.com/YOUR-USERNAME/taskflow.git
cd taskflow

# Start with Docker Compose
docker-compose up -d

# Verify services
docker-compose ps

# Access API
curl http://localhost:3000/health
```

### Kubernetes (Minikube)
```bash
# Start Minikube
minikube start --cpus=4 --memory=8192

# Create namespace
kubectl create namespace taskflow

# Apply manifests
kubectl apply -f k8s/manifests/

# Port forward
kubectl port-forward -n taskflow svc/taskflow-backend 3000:3000

# Access API
curl http://localhost:3000/health
```

## 📖 Usage

### API Endpoints
```bash
# Health Check
GET /health
# Response: {"status":"healthy","timestamp":"...","environment":"..."}

# Get all tasks
GET /api/tasks
# Response: [{"id":1,"title":"Learn Docker","completed":false}]

# Create task
POST /api/tasks
# Body: {"title":"New task","description":"..."}
# Response: {"id":4,"title":"New task","completed":false}
```

### Environment Variables
```bash
NODE_ENV=production          # Environment
PORT=3000                    # Server port
DATABASE_HOST=localhost      # Database host
DATABASE_PORT=5432          # Database port
DATABASE_NAME=taskflow      # Database name
DATABASE_USER=postgres      # Database user
DATABASE_PASSWORD=secret    # Database password
REDIS_HOST=localhost        # Redis host
REDIS_PORT=6379            # Redis port
JWT_SECRET=your-secret      # JWT secret
LOG_LEVEL=info             # Log level
```

## 🛠️ Development

### Project Structure
taskflow/
├── backend/                 # Node.js backend
│   ├── src/index.js        # Main application
│   ├── package.json        # Dependencies
│   └── .env               # Configuration
├── docker/                 # Docker configuration
│   └── Dockerfile.backend # Backend image
├── k8s/                   # Kubernetes manifests
│   ├── manifests/         # YAML files
│   └── taskflow-helm/     # Helm charts
├── terraform/             # Infrastructure as Code
│   ├── main.tf           # VPC & networking
│   ├── eks.tf            # Kubernetes cluster
│   ├── rds.tf            # Database
│   └── elasticache.tf    # Cache
├── .github/workflows/     # CI/CD workflows
├── README.md             # This file
└── .gitignore           # Git ignore rules

### Running Tests
```bash
cd backend
npm install
npm test              # Unit tests
npm run lint         # Code linting
npm start            # Start server
```

## ☁️ Deployment

### AWS EKS Deployment
```bash
# Initialize Terraform
cd terraform
terraform init

# Plan infrastructure
terraform plan -out=tfplan

# Create infrastructure
terraform apply tfplan

# Configure kubectl
aws eks update-kubeconfig --name taskflow-cluster --region us-east-1

# Deploy TaskFlow
kubectl apply -f ../k8s/manifests/

# Get Load Balancer URL
kubectl get svc taskflow-backend -n taskflow
```

### Cleanup
```bash
# Delete Kubernetes resources
kubectl delete all --all -n taskflow

# Destroy infrastructure
cd terraform
terraform destroy -auto-approve
```

## 📊 Monitoring

### CloudWatch Dashboards

- **Application Metrics**: Request rate, response time, errors
- **Infrastructure**: CPU, memory, disk usage
- **Database**: Connections, query performance
- **Cache**: Hit rate, evictions

### Alarms

- High error rate (>5%)
- High CPU (>80%)
- High memory (>80%)
- Database connection issues
- Cache evictions

### Logs

- Application logs in CloudWatch Logs
- Centralized log aggregation
- Log analysis and insights

## 📚 Documentation

- [Architecture Guide](docs/architecture.md)
- [Deployment Guide](docs/deployment.md)
- [Operations Runbook](docs/runbook.md)
- [Troubleshooting Guide](docs/troubleshooting.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## 📄 License

This project is licensed under MIT License.

## 👤 Author

Your Name - Ankush Katoch

## 🙏 Acknowledgments

- Docker
- Kubernetes
- AWS
- GitHub Actions
- Terraform

---

**Status**: ✅ Production Ready  
**Last Updated**: 2025-12-17  
**Version**: 1.0.0

EOF
