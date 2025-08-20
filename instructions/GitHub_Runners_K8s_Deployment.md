# Deploying GitHub Actions Runners on Kubernetes (Dedicated Namespace)

This guide explains how to deploy self-hosted GitHub Actions runners in Kubernetes using the **Actions Runner Controller (ARC)** Helm chart.  
The runners are registered at the **organization level (`Apache-Corporation`)**, so they can be used by any repository within the organization.  

All deployments are isolated in a dedicated namespace: **`github-runners`**, with TLS certificates managed by **cert-manager**.

---

## 1. Prerequisites

- Kubernetes cluster access (`kubectl` + `helm` configured)
- Namespace: `github-runners` (created later)
- A **GitHub Personal Access Token (PAT)** with the following scopes:  
  👉 [GitHub Docs: Managing Personal Access Tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)

---

## 2. Install cert-manager (via Helm)

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.3/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cert-manager

helm install cert-manager jetstack/cert-manager   --namespace cert-manager   --create-namespace   --set installCRDs=true
```

---

## 3. Add Helm Repository

```bash
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
helm repo update
```

---

## 4. Install ARC in Dedicated Namespace

```bash
kubectl create namespace github-runners

helm install arc actions-runner-controller/actions-runner-controller   -n github-runners   --set authSecret.create=true   --set authSecret.github_token=<YOUR_PERSONAL_ACCESS_TOKEN>
```

---

## 5. Deploy an Organization-Level Runner

Create a YAML file named **`org-runner.yaml`**:

```yaml
apiVersion: actions.summerwind.dev/v1alpha1
kind: RunnerDeployment
metadata:
  name: apache-org-runner
  namespace: github-runners
spec:
  template:
    spec:
      organization: ApacheCorporation
      labels:
        - self-hosted
        - apache
---
apiVersion: actions.summerwind.dev/v1alpha1
kind: HorizontalRunnerAutoscaler
metadata:
  name: apache-org-runner-autoscaler
  namespace: github-runners
spec:
  scaleTargetRef:
    name: apache-org-runner
  minReplicas: 1
  maxReplicas: 10
  scaleDownDelaySecondsAfterScaleOut: 300  
  metrics:
    - type: TotalNumberOfQueuedAndInProgressWorkflowRuns
      repositoryNames:
        - "githubrunnertest" # replace with actual repositories
      scaleUpThreshold: "1"
      scaleDownThreshold: "0"
      scaleUpFactor: "1"
      scaleDownFactor: "1"
```

Apply the file:

```bash
kubectl apply -f org-runner.yaml
```

---

## 6. Verify Deployment

- **Check pods**:
  ```bash
  kubectl get pods -n github-runners
  ```

- **View logs**:
  ```bash
  kubectl logs -f <runner-pod-name> -n github-runners
  ```

- **Confirm in GitHub**:  
  Go to **Organization → Settings → Actions → Runners**.  
  You should see your runners **online**.

---

✅ Your self-hosted runners are now deployed on Kubernetes and ready for use across your organization!
